class EventBanner < ActiveRecord::Base
 has_one :event

 has_attached_file :banner, :styles => { :small => "150x150>" },
                  :url  => "/assets/attachments/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/attachments/:id/:style/:basename.:extension"

validates_attachment_presence :banner
validates_attachment_size :banner, :less_than => 5.megabytes
validates_attachment_content_type :banner, :content_type => ['image/jpeg', 'image/png']
end
