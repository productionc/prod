class Course < ActiveRecord::Base
  has_many :course_materials, dependent: :destroy

  accepts_nested_attributes_for :course_materials, reject_if: :all_blank, allow_destroy: true
end
