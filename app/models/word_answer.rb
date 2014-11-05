class WordAnswer < ActiveRecord::Base
  belongs_to :word
  has_one :lesson_word
  
  scope :correct, -> {
    where(correct: 1).first
  }
end
