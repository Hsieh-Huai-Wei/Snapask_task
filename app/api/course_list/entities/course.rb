module CourseList
  module Entities
     class Course < Grape::Entity
        expose :title
        expose :price
        expose :currency
        expose :course_type
        expose :is_available
        expose :link
        expose :description
        expose :expiry_day
    end
  end
end