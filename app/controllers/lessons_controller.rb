class LessonsController < ApplicationController
  before_action :signed_in_user
  
  def new
    @lesson = Lesson.new()
  end
  
  def show
    @lesson = Lesson.find params[:id]
    @category = Category.order("RAND()").first
    create_lesson_words(@lesson, @category)
    @lesson_words = @lesson.lesson_words.all
    @UserWord = UserWord.new
  end
  
  def create_lesson_words(lesson, category)
    20.times do |n|
      word = category.words.order("RAND()").first
      lesson.lesson_words.create!(word_id: word.id)
    end
  end
end
