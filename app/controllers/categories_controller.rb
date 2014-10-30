class CategoriesController < ApplicationController
  before_action :signed_in_user
  
  def index
    @lessons = Lesson.all
  end
end
