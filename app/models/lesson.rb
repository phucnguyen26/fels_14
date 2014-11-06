class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :user_words
  has_many :lesson_words
end
