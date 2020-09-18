class CoursesController < ApplicationController
  


  def show
    @course = Course.find(params[:id])
  end

  def index
    @courses = Course.all.where(:is_available => true)
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

end
