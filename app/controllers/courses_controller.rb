class CoursesController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy] # operate after log in

  def show
    @course = Course.find(params[:id])
  end

  def index
    @courses = Course.all.where(:is_available => true)
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path
    else
      render :new
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      redirect_to courses_path
    else
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to courses_path
  end

  def purchase_course
    course = Course.find(params[:id]).id
    userEmail = current_user.email
    user = User.where(email: userEmail).ids[0]
    check = PurchaseOrder.where(user_id: user, course_id: course)[0]
    if check != nil
      redirect_to courses_path
      flash[:alert] = "已經購買"
    else
      buy = PurchaseOrder.new(user_id: user, course_id: course)
      buy.save
      redirect_to courses_path
      flash[:alert] = "購買完成"
    end
  end

  private

  def course_params
    params.require(:course).permit(:title, :description)
  end

end
