class Word < ActiveRecord::Base
  belongs_to :category
  has_many :user_words
  has_many :word_answers
  
  scope :all_by_category, ->(category_id) {
    where(category_id: category_id)
  }

  scope :learned_by_category, ->(user_id, category_id) {
    word_ids = UserWord.select("word_id")
      .where(user_id: user_id)
      .to_sql         
    where("id IN (#{word_ids}) AND category_id = ?", category_id)
  }

  scope :unlearned_by_category, ->(user_id, category_id) {
    word_ids = UserWord.select("word_id")
      .where(user_id: user_id)
      .to_sql         
    where("id NOT IN (#{word_ids}) AND category_id = ?", category_id)
  }
end