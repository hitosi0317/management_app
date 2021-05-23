class MotionsController < ApplicationController
  def index
    if user_signed_in?
    @motion = Motion.all
    end
  end
  # @items = Item.all

  # @item.each do |item|
  #   if item.user_id == current_user.id
  #     ~~~
  #   end
  # end

  # current_user.items each do |item|
  # do

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

  def show
    if user_signed_in? 
      @motion = Motion.find(params[:id])
      if @motion.present?
      @bmi = @motion.weight / @motion.user.height / @motion.user.height * 10000
    
      if 25 <= @bmi
       @bmidifference = 25.00 - @bmi
      else
       @bmidifference = 18.5 - @bmi
      end
    end
    end
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
    params.require(:motion).permit(:weight,:training1,:training2,:training3,:training4,:training5,:count1,:count2,:count3,:count4,:count5,:memo).merge(user_id: current_user.id)
  end

end

