class DepartmentPreference < ActiveRecord::Base
 belongs_to :preference
 belongs_to :event_department
 belongs_to :event_department_stream
end
