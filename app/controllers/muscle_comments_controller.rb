class MuscleCommentsController < ApplicationController

  def create
    muscle = Muscle.find(params[:muscle_id])
    comment = current_user.muscle_comments.new(muscle_comment_params)
    comment.muscle_id = muscle.id
    comment.save
    redirect_to request.referer
  end

  def destroy
    MuscleComment.find(params[:id]).destroy
    redirect_to request.referer
  end



  private
  def muscle_comment_params
    params.require(:muscle_comment).permit(:comment)
  end
end
