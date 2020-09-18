module CourseList
  class Base < Grape::API
    mount CourseList::V1::Courses
  end
end