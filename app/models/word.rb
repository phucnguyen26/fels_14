class Word < ActiveRecord::Base
  belongs_to :category
  has_many :user_words
  has_many :word_answers
end
