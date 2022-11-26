class MusclesController < ApplicationController
  def new
    @muscle = Muscle.new
  end

  def create
    @muscle = Muscle.new(muscle_params)
    @muscle.user_id = current_user.id
    if @muscle.save
      redirect_to muscles_path
    else
      render :new
    end
  end

  def update
    muscle = Muscle.find(params[:id])
    if muscle.update(muscle_params)
      redirect_to muscle_path(muscle.id)
    else
      render :edit
    end
  end

  def destroy
    @muscle = Muscle.find(params[:id])
    @muscle.destroy
    redirect_to muscles_path
  end

  def index
    #@muscles = Muscle.all
    @muscles = Muscle.page(params[:page])
    @muscles = @muscles.joins(:labels).where(labels: { id: params[:label_id] }) if params[:label_id].present?
    
    @label_list = Label.all
    
   # @search = Muscle.ransack(params[:q])
    #@search_muscles = @search.result
    #if @search_header
      #@search_muscles = @search_header.result
    #end
  end

  def show
    @muscle = Muscle.find(params[:id])
    @user = @muscle.user
    @muscle_comment = MuscleComment.new
    
    @label_list = Label.all
    @muscle_lists = @muscle.labels
  end

  def edit
    @muscle = Muscle.find(params[:id])
  end

  private
  def muscle_params
    params.require(:muscle).permit(:title, :image, :caption, :rate, { label_ids: []})
  end
end
