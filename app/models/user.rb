class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  has_many :places,  dependent: :destroy
          #必ず複数形   #ユーザーが消去されると紐づく場所も削除されるって意味！！！！

          with_options presence: true do
            validates :username
          end
end
