class Place < ApplicationRecord
  belongs_to:user #placeは必ずuser一人に属する!!
                  #次にuserモデルには has_many を記述する（placeをたくさん持っているから！）
  attachment :image # image_id というカラムが存在するので、:image だけでいい。

  #validation >>空の投稿があったときそれを弾く仕組みのこと。以下の書き方。まずモデルの記述。次はコントローラーの記述。
  with_options presence: true do
    validates :title
    validates :body
    validates :howto
    validates :image
  end
end
