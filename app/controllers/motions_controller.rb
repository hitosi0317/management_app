class MotionsController < ApplicationController
  def index
    if user_signed_in? 
      binding.pry
      @motion = current_user.motion
    end
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
    params.require(:motion).permit(:training1,:training2,:training3,:training4,:training5,:count1,:count2,:count3,:count4,:count5).merge(user_id: current_user.id)
  end

end

