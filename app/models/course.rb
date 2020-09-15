class Course < ApplicationRecord
  validates :title, presence: true # let input must be fill in
  validates :price, numericality: { greater_than: 0 }
  validates :currency, presence: true
  validates :course_type, presence: true
  validates :link, presence: true
  validates :description, presence: true
  validates :expiry_day, numericality: { greater_than: 0, less_than: 31}

  has_many :purchase_orders
  has_many :users, :through => :purchase_orders

end
