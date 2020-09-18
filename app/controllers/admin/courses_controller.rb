class Admin::CoursesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :require_is_admin

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to admin_courses_path
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
      redirect_to admin_courses_path
    else
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:id])

    @course.destroy

    redirect_to admin_courses_path
  end

  private

  def course_params
    params.require(:course).permit(:title, :price, :currency, :course_type, :is_available, :link, :description, :expiry_day)
  end
end