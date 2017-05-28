class Internship < ActiveRecord::Base
 belongs_to :job_type
 belongs_to :stipend_type
 belongs_to :stipend_amount
 has_many :applied_internships
 belongs_to :user

 accepts_nested_attributes_for :stipend_amount, reject_if: :all_blank, allow_destroy: true
end
