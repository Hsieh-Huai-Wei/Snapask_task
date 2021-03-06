class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :purchase_orders
  has_many :courses, :through => :purchase_orders

  def admin?
    email == 'admin@admin.com'
  end
end
