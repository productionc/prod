class EventDepartmentStream < ActiveRecord::Base
 belongs_to :event_department
 has_one :department_preference
end
