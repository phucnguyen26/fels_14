class MicropostsController < ApplicationController
before_action :logged_in_user, only: [:create, :destroy]
before_action :correct_user,   only: :destroy

  def new
    @micropost = Micropost.new
  end

  def index
    @microposts = Micropost.all
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
        if @micropost.save
            flash[:success] = "Micropost created!"
            redirect_to @micropost
        else
            render 'new'
        end
  end
  
  def show
    @micropost = Micropost.find(params[:id])
     #@comment = @micropost.comments.build(params[:comment])
    @comment = Comment.new
  end
  def edit
    @micropost = Micropost.find(params[:id])
  end
  def destroy
      @micropost.destroy
      flash[:success] = "Micropost deleted"
      redirect_to request.referrer || root_url
    end
  def update
      @micropost = Micropost.find(params[:id])
 
      if @micropost.update(micropost_params)
          redirect_to @micropost
      else
          render 'edit'
        end
  end
  
private
  def micropost_params
      params.require(:micropost).permit(:content, :user_id, :title)
  end
  def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
  end
end
