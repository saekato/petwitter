class Like < ApplicationRecord
  belongs_to :article
  belongs_to :user
  
  #user_idとarticle_idどちらも存在している
  validates :user_id, {presence: true}
  validates :article_id, {presence: true}
  
  #人が１つの投稿に対して、１つしかいいねをつけられないようにする(自分の投稿含)
  validates_uniqueness_of :article_id, scope: :user_id
end
