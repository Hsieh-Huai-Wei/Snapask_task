module ProfileList
  module V1
    class Profiles < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :profiles do

        desc 'All courses that have been bought'
        get do
          courses = Course.all
          present courses
          
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

        desc 'Courses that have not expired'
          route_param :action do
            get do
            puts params
          end
        end
        
      end
    end
  end
end