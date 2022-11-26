class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search #set_
  

  def after_sign_in_path_for(resource)
    muscles_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def set_search #set_
    @search = Muscle.ransack(params[:q])
    @search_muscles = @search.result
  end
  
  def search
    @label_list = Label.all
    @label = Label.find(params[:label_id])
    @muscles_search =@label.muscles.all
    @muscles = Muscle.page(params[:page])
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  
  
  
end
