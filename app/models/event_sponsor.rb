class EventSponsor < ActiveRecord::Base
 belongs_to :event

  has_attached_file :sponsor, styles: {
    thumb: '150x150>',
  }

validates_attachment_presence :sponsor
validates_attachment_size :sponsor, :less_than => 5.megabytes
validates_attachment_content_type :sponsor, :content_type => ['image/jpeg', 'image/png']
end
