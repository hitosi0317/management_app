class MotionsController < ApplicationController
  def index
    @current_user = current_user.motion
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


  def edit
    @motion = Motion.find(params[:id])
  end

  def update
    @motion = Motion.find(params[:id])
    if @motion.update(motion_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @motion = Motion.find(params[:id])
    redirect_to root_path if @motion.destroy
  end

  private

  def motion_params
    params.require(:motion).permit(:training1,:training2,:training3,:training4,:training5,:count1,:count2,:count3,:count4,:count5).merge(user_id: current_user.id)
  end

end

