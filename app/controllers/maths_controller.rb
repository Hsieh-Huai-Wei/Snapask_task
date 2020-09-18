class MathsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy] # operate after log in

  def index
    userEmail = current_user.email
    user = User.where(email: userEmail).ids[0]
    @math = PurchaseOrder.joins(:course).select('courses.title, courses.price, courses.currency, courses.course_type, courses.is_available, courses.link, courses.description, courses.expiry_day, purchase_orders.created_at').where(user_id: user).where('"courses.course_type" = "math"')
  end

end
