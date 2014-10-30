class Word < ActiveRecord::Base
  belongs_to :category
  has_many :word_answers
  has_one :lesson_word
  
  scope :all_by_category, ->(category_id) {
    where(category_id: category_id)
  }

  scope :learned_by_category, ->(user_id, category_id) {
    lesson_word_ids = LessonWord.select("word_id")
      .where(lesson_id: Lesson.select("id").where(user_id: user_id))
      .to_sql
    where("id IN (#{lesson_word_ids}) AND category_id = ?", category_id)
  }

  scope :unlearned_by_category, ->(user_id, category_id) {
    lesson_word_ids = LessonWord.select("word_id")
      .where(lesson_id: Lesson.select("id").where(user_id: user_id))
      .to_sql
    where("id NOT IN (#{lesson_word_ids}) AND category_id = ?", category_id)
  }
end
