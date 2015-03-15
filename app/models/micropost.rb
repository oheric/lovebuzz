class Micropost < ActiveRecord::Base
  attr_acccessible :content
  validates :user_id, presence: true
  belongs_to :user
end