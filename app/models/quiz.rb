class Quiz < ActiveRecord::Base
  validates_presence_of :name
  validates_length_of :name, maximum: 50

  belongs_to :user
  has_many :questions
end