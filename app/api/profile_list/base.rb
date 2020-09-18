module ProfileList
  class Base < Grape::API
    mount ProfileList::V1::Profiles
  end
end