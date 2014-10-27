class StaticPagesController < ApplicationController
  
  def index
    
  end
  
  def home
    @user = current_user
  end
   
  def about
  end

  def contact
  end
end