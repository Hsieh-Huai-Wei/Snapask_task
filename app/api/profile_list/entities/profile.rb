module ProfileList
  module Entities
     class Profile < Grape::Entity
        expose :title
        expose :price
        expose :currency
        expose :course_type
        expose :is_available
        expose :link
        expose :description
        expose :expiry_day
        expose :created_at
    end
  end
end