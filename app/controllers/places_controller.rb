class PlacesController < ApplicationController
  before_action :authenticate_user!, except: [:index] 

  #deviseを導入すると使えるヘルパー。ログインしていない人は index アクション以外全てのアクションにアクセスできなくなる
  #users controllerにも同様に記述。

  def index  #place一覧
    @places = Place.all
  end

  def show
    @place =Place.find(params[:id])
  end

  def new
    @place = Place.new #placeモデルから空のモデルを持ってくるってこと
  end

  def create #データベースに登録するアクション。
    @place = Place.new(place_params) #(place_params) でとってくるデータを選定。詳しい処理は下でprivateに記述する。
    @place.user_id = current_user.id #誰が投稿したのか。 @recipe の user_id は今ログインしている人 current_user.id に等しい
    if @place.save #保存
      redirect_to place_path(@place), notice: "投稿に成功しました"#placeの詳細画面に遷移（place_path）。今投稿された(@place)の詳細へと指定。
    else
      render :new #render はアクションを返さずに（:new）ビューだけを返すシステム。
    end
  end
  
  def edit
    @place = Place.find(params[:id])
    if
      @place.user != current_user
      # @placeにひもづくuser と今のユーザーcurrent_userが同じではない時
      redirect_to places_path, alert: '不正なアクセスです'
      # placeの一覧画面へ遷移したいので、places_path
    end
  end

  def update
    @place = Place.find(params[:id])
    if @place.update(place_params)
      redirect_to place_path(@place), notice: "投稿を更新しました。"
    else
      render :edit
    end
  end

   def destroy
    place = Place.find(params[:id]) #placeの削除するものを選定。
    place.destroy  #削除
    redirect_to place_path(place.user), notice: "観光地を削除しました。" #placeの一覧画面に遷移
  end

  private
  def place_params
    params.require(:place) .permit(:title, :body, :howto, :image)
  end
    #モデルの選定require(:place)
    #カラムの選定 permit(:title, :body, :howto, :image)
end
