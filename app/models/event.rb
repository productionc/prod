class Event < ActiveRecord::Base

 belongs_to :event_detail
 belongs_to :event_registration
 has_and_belongs_to_many :event_departments
 has_many :event_contact_details
 has_many :event_guest_details
 belongs_to :event_url
 has_and_belongs_to_many :event_extras
 belongs_to :event_accomodation
 belongs_to :event_banner
 belongs_to :event_college_banner
 belongs_to :event_broucher
 belongs_to :event_sponsor

 accepts_nested_attributes_for :event_detail, reject_if: :all_blank, allow_destroy: true
 accepts_nested_attributes_for :event_registration, reject_if: :all_blank, allow_destroy: true
 accepts_nested_attributes_for :event_contact_details, reject_if: :all_blank, allow_destroy: true
 accepts_nested_attributes_for :event_guest_details, reject_if: :all_blank, allow_destroy: true
 accepts_nested_attributes_for :event_url, reject_if: :all_blank, allow_destroy: true
 accepts_nested_attributes_for :event_accomodation, reject_if: :all_blank, allow_destroy: true
 accepts_nested_attributes_for :event_banner, reject_if: :all_blank, allow_destroy: true
 accepts_nested_attributes_for :event_college_banner, reject_if: :all_blank, allow_destroy: true
 accepts_nested_attributes_for :event_broucher, reject_if: :all_blank, allow_destroy: true
 accepts_nested_attributes_for :event_sponsor, reject_if: :all_blank, allow_destroy: true

  def to_param
    [id, event_name.parameterize, study_place.parameterize, district.parameterize].join("-")
  end
end
