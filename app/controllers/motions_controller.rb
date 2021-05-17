class MotionsController < ApplicationController
  def index
  end

  def new
    @motion = Motion.new
  end

  def create
    @motion = Motion.new(motion_params)
    if @motion.save
      redirect_to root_path
    else
      render :new  
    end
  end

  private

  def motion_params
    params.require(:motion).permit(:weight,:training1,:training2,:training3,:training4,:training5,:count1,:count2,:count3,:count4,:count5,:memo).merge(user_id: current_user.id)
  end

end

