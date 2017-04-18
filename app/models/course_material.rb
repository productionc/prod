class CourseMaterial < ActiveRecord::Base
  belongs_to :course

  has_attached_file :material
  do_not_validate_attachment_file_type :material
end
