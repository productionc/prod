class EventBanner < ActiveRecord::Base
 has_one :event

 has_attached_file :banner, styles: {
    thumb: '150x150>',
  }

 validates_attachment_presence :banner
 validates_attachment_size :banner, :less_than => 5.megabytes
 validates_attachment_content_type :banner, :content_type => ['image/jpeg', 'image/png']
end
