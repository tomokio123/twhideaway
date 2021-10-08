class ApplicationController < ActionController::Base
  #新規登録でユーザーネームも保存できるようにしたい

  before_action :configure_permitted_parameters, if: :devise_controller?
  #アクション（メソッド）を呼び出す時、そのアクションが所属するコントローラー名が「devise_controller」であれば
  #before_actionの中身が実行されるって意味。つまりユーザーのページにアクセスする前（before_action）に実行される

  private   #(コントローラの中でしか呼び出したくないメソッド > private)
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    #devise_parameter_sanitizerとは、sign_upの時にusernameを許可する（permit）ってこと。
  end
end
