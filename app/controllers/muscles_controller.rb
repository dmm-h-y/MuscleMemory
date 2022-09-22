class MusclesController < ApplicationController
  def new
    @muscle = Muscle.new
  end

  def create
    @muscle = Muscle.new(muscle_params)
    @muscle.user_id = current_user.id
    @muscle.save
    redirect_to muscles_path
  end

  def destroy
    @muscle = Muscle.find(params[:id])
    @muscle.destroy
    redirect_to muscles_path
  end

  def index
    @muscles = Muscle.all
  end

  def show
    @muscle = Muscle.find(params[:id])
    @user = @muscle.user
  end

  private
  def muscle_params
    params.require(:muscle).permit(:title, :image, :caption, :rate)
  end
end
