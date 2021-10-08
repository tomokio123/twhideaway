Rails.application.routes.draw do

  #get 'places/index' <別にいらんからコメントアウトしていい。
  #get 'places/show'  rails g controller places indexでローカルホスト作成した時に勝手に生成される.
  #get 'places/new'   下記  resources :places  で自動生成してくれる
  #get 'places/edit'

  #get 'users/index' <別にいらんからコメントアウトしていい。
  #get 'users/show'   rails g controller users indexでローカルホスト作成した時に勝手に生成される.
  #get 'users/edit'   下記  resources :users  で自動生成してくれる

  #get 'home/index'  <別にいらんからコメントアウトしていい。下記に記述、
  #rails g controller home indexでローカルホスト作成した時に勝手に生成される

  devise_for :users
  root to: "home#index"  #ログアウト時などのリダイレクト先として root_url の指定をする
  #localhost:3000にアクセスしたらhomeコントローラのindexアクションが呼び出されるという記述

  resources :users # > rails routesで確認するとusersコントローラーのアクションが自動追加されている。
  resources :places # > rails routesで確認するとplacesコントローラーのアクションが自動追加されている。

  #このあとアソシエーションを設定する。models/place.rbで、一対N、の関係を記述しないといけない。
  #ER図より placs=必ずユーザー一人に対して属する ってこと


end
