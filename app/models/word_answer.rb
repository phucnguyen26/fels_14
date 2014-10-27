class WordAnswer < ActiveRecord::Base
  belongs_to :word
  
  scope :correct, -> {
    where(correct: 1).first
  }
end
