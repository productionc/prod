class EventDepartment < ActiveRecord::Base
  has_and_belongs_to_many :events
  has_one :event_department_stream
  has_and_belongs_to_many :preferences
  has_one :user
end
