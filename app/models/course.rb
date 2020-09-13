class Course < ApplicationRecord
  validates :title, presence: true #let input must be fill in
end
