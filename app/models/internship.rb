class Internship < ActiveRecord::Base
 belongs_to :job_type
 belongs_to :stipend_type
 belongs_to :stipend_amount

 accepts_nested_attributes_for :stipend_amount, reject_if: :all_blank, allow_destroy: true
end
