class EventCollegeBanner < ActiveRecord::Base
 has_one :event

 has_attached_file :college_banner, :styles => { :small => "150x150>" },
                  :url  => "/assets/attachments/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/attachments/:id/:style/:basename.:extension"

validates_attachment_presence :college_banner
validates_attachment_size :college_banner, :less_than => 5.megabytes
validates_attachment_content_type :college_banner, :content_type => ['image/jpeg', 'image/png']
end
