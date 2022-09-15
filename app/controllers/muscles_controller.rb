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

  def index
  end

  def show
  end

  private
  def muscle_params
    params.require(:muscle).permit(:title, :image, :title)
  end
end
