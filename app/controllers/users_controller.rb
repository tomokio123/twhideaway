class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index] 
  
  #deviseを導入すると使えるヘルパー。ログインしていない人は index アクション以外全てのアクションにアクセスできなくなる
  #places controllerにも同様に記述。

  def index #ユーザーの一覧を表示する
    @users = User.all #全員分とってくるから複数形よ。userモデル(=User)から。
  end

  def show #ユーザーの詳細画面を表示する
    @user = User.find(params[:id]) #ひとりのユーザーの情報を持ってくる
  end

  def edit
    @user =User.find(params[:id])
    if @user != current_user
      redirect_to users_path, alert: "不正なアクセスです"
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)    #user_paramsは以下で定義。どのカラムをアップデートするかを指定している。
      redirect_to user_path(@user), notice: "更新に成功しました" #userの詳細画面に遷移する
    else
      render :edit # editのviewに遷移
    end
  end

  private #>>privateによってuserscontrollerの中でしか、user_params は使えないという設定になる。外部からデータベースの情報を取り出しせないのでセキュリティに強くなる
  def user_params #アップデートカラムの指定
    params.require(:user).permit(:username, :email, :profile_image, :profile)
  end
end
