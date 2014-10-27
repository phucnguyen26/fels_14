class WordsController < ApplicationController
  before_action :signed_in_user
  
  def index
    @categories = Category.all
    if params[:category_id]
      category_id = params[:category_id]
      @status = params[:status] ? params[:status] : "all"
      @category = Category.find category_id
      case @status
      when "all"
        @words = @category.words
      when "learned"
        @words = Word.learned_by_category current_user.id, category_id
      else
        @words = Word.unlearned_by_category current_user.id, category_id 
      end
    else
      @words = Word.all
    end
  end
end
