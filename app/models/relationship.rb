class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  # belongs toだけだとfollowerテーブル探しに行く
  # →そんなもの実在しない。
  # →classで探す先のテーブル名(User)指定する
  

end
