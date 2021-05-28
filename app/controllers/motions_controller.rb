  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :show, :destroy]
  before_action :move_to_index, except: [:index, :show, :new, :edit, :create, :destroy]
  before_action :set_motion, only: [:edit, :show, :destroy, :update]
  def index
    @motions = Motion.all if user_signed_in?
    @motion = Motion.last
    unless @motion.nil?
      @bmi = @motion.weight / @motion.user.height / @motion.user.height * 10_000

      @bmidifference = if 25 <= @bmi
                         25.00 - @bmi
                       else
                         18.5 - @bmi
                       end
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

  def edit
    @motion = Motion.find(params[:id])
  end

  def show
    
      @bmi = @motion.weight / @motion.user.height / @motion.user.height * 10_000

      @bmidifference = if 25 <= @bmi
                         25.00 - @bmi
                       else
                         18.5 - @bmi
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
    redirect_to root_path if @motion.destroy
  end

  private

  def motion_params
    params.require(:motion).permit(:weight, :plans1, :plans2, :plans3, :plans4, :plans5, :count1, :count2, :count3, :count4,
                                   :count5, :memo).merge(user_id: current_user.id)
  end

  def set_motion
    @motion = Motion.find(params[:id])
  end
end
