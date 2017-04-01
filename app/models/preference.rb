class Preference < ActiveRecord::Base
 has_and_belongs_to_many :event_types
 has_many :location_preferences, dependent: :destroy
 has_many :department_preferences, dependent: :destroy

 accepts_nested_attributes_for :location_preferences, reject_if: :all_blank, allow_destroy: true
 accepts_nested_attributes_for :department_preferences, reject_if: :all_blank, allow_destroy: true
end
