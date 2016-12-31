class EventSponsor < ActiveRecord::Base
  has_one :event

 has_attached_file :sponsor, :styles => { :small => "150x150>" },
                  :url  => "/assets/attachments/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/attachments/:id/:style/:basename.:extension"

validates_attachment_presence :sponsor
validates_attachment_size :sponsor, :less_than => 5.megabytes
validates_attachment_content_type :sponsor, :content_type => ['image/jpeg', 'image/png']
end
