class EventBroucher < ActiveRecord::Base
 has_one :event

 has_attached_file :broucher

validates_attachment_presence :broucher
validates_attachment_size :broucher, :less_than => 30.megabytes
validates_attachment_content_type :broucher, :content_type => ['application/pdf']
end
