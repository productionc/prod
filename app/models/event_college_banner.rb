class EventCollegeBanner < ActiveRecord::Base
 has_one :event

  has_attached_file :college_banner, styles: {
    thumb: '150x150>',
  }

validates_attachment_presence :college_banner
validates_attachment_size :college_banner, :less_than => 5.megabytes
validates_attachment_content_type :college_banner, :content_type => ['image/jpeg', 'image/png']
end
