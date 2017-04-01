class EventDepartment < ActiveRecord::Base
  has_and_belongs_to_many :events
  has_one :department_preference
  has_one :event_department_stream
end
