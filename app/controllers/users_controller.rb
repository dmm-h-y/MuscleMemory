class UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]
  
  
  def show
    @user = User.find(params[:id])
    #@muscles = @user.muscles
    @muscles = @user.muscles.page(params[:page])
    
    #追記
    @label_list = Label.all
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "ゲスト"
      redirect_to user_path(current_user)
    end
  end  



end
