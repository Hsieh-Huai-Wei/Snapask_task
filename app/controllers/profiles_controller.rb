class ProfilesController < ApplicationController
  def index
    userEmail = current_user.email
    user = User.where(email: userEmail).ids[0]
    @purchase_order = PurchaseOrder.joins(:course).select('courses.title, purchase_orders.created_at').where(user_id: user)
  end
end