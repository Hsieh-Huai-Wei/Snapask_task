module CourseList
  module V1
    class Courses < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :courses do

        desc 'Return list of courses'
        get do
          courses = Course.all.where(:is_available => true)
          present courses
        end

        desc 'Return a specific course'
          route_param :id do
            get do
              course = Course.find(params[:id])
              present course, with: CourseList::Entities::Course
            end
          end
          
        desc "Create new post"
        params do
          requires :courseId, type: Integer
        end
        post do
          course = Course.find(params[:courseId]).id
        end

      end
    end
  end
end

