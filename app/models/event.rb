class Event < ActiveRecord::Base

 include ApplicationHelper
 belongs_to :user
 belongs_to :event_detail, dependent: :destroy
 has_and_belongs_to_many :event_departments, dependent: :destroy
 has_many :event_contact_details, dependent: :destroy
 has_many :event_guest_details, dependent: :destroy
 belongs_to :event_url, dependent: :destroy
 has_and_belongs_to_many :event_extras, dependent: :destroy
 belongs_to :event_accomodation, dependent: :destroy
 belongs_to :event_banner, dependent: :destroy
 belongs_to :event_college_banner, dependent: :destroy
 belongs_to :event_broucher, dependent: :destroy
 has_many :event_sponsors, dependent: :destroy
 after_create :publish_msg
 has_many :event_bookmarks, dependent: :destroy

 accepts_nested_attributes_for :event_detail, reject_if: :all_blank, allow_destroy: true
 accepts_nested_attributes_for :event_contact_details, reject_if: :all_blank, allow_destroy: true
 accepts_nested_attributes_for :event_guest_details, reject_if: :all_blank, allow_destroy: true
 accepts_nested_attributes_for :event_url, reject_if: :all_blank, allow_destroy: true
 accepts_nested_attributes_for :event_accomodation, reject_if: :all_blank, allow_destroy: true
 accepts_nested_attributes_for :event_banner, reject_if: :all_blank, allow_destroy: true
 accepts_nested_attributes_for :event_college_banner, reject_if: :all_blank, allow_destroy: true
 accepts_nested_attributes_for :event_broucher, reject_if: :all_blank, allow_destroy: true
 accepts_nested_attributes_for :event_sponsors, reject_if: :all_blank, allow_destroy: true
 accepts_nested_attributes_for :event_departments, reject_if: :all_blank, allow_destroy: true

 def publish_msg
  begin
    Pusher.trigger('my-channel', 'my-event', {
      message: self.id
    })
  rescue Pusher::Error => e
    Rails.logger.error "Pusher error: #{e.message}"
  end
 end

 def to_param
    [id, event_name.parameterize, study_place.parameterize, district.parameterize].join("-")
 end
  
end
