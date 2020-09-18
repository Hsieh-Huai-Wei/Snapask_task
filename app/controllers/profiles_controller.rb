class ProfilesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy] # operate after log in

  def index
    userEmail = current_user.email
    user = User.where(email: userEmail).ids[0]
    @history = PurchaseOrder.joins(:course).select('courses.*').where(user_id: user)
    puts @history
  end

  def show
    userEmail = current_user.email
    user = User.where(email: userEmail).ids[0]
    check = params[:id].to_i
    @history = Course.find(params[:id])
  end

end

