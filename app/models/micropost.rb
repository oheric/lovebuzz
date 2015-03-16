class Micropost < ActiveRecord::Base
  attr_acccessible :content
  validates :user_id, presence: true
  validates :content, presnece: true, length: { maximum: 140}
  belongs_to :user

  default_scope order: 'microposts.created_at DESC'
end