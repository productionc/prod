class Api::V1::Serializers::EventDetailSerializer < ActiveModel::Serializer
  attributes :id, :event_name, :study_place, :district, :state, :country, :event_type, :start_date,
  :end_date, :event_icon_url, :going_count, :reach_count, :may_be_count, :no_of_days, :about_tab,
  :event_tab, :register_tab, :contact_tab

  def start_date
    object.event_detail.try(:start_date).strftime("%m/%d/%Y %I:%M %p")
  end

  def end_date
    object.event_detail.try(:end_date).strftime("%m/%d/%Y %I:%M %p")
  end

  def event_icon_url
    object.event_college_banner.college_banner.url
  end

  def going_count
    object.event_goings.sum(:going_count)
  end

  def reach_count
    object.event_goings.sum(:reach_count)
  end

  def may_be_count
    object.event_goings.sum(:may_be_count)
  end

  def no_of_days
    (Date.parse(object.event_detail.end_date.to_s.split(' ')[0]) - 
     Date.parse(object.event_detail.start_date.to_s.split(' ')[0])).to_i+1
  end

  def about_tab
    {
      event_description: object.event_detail.event_description,
      college_web_url: object.event_url.college_link.present? ? object.event_url.college_link : "",
      accomodation: object.event_accomodation.accomodation,
      event_web_url: object.event_url.web_link.present? ? object.event_url.web_link : "",
      event_registration_url: object.event_url.registration_link.present? ? object.event_url.registration_link : "",
      facebook_url: object.event_url.facebook_link.present? ? object.event_url.facebook_link : "",
      twitter_url: object.event_url.twitter_link.present? ? object.event_url.twitter_link : "",
      youtube_url: object.event_url.youtube_link.present? ? object.event_url.youtube_link : "",
      apps_url: object.event_url.apps_link.present? ? object.event_url.apps_link : "",
      guest_speakers: guest_speakers
    }
  end

  def event_tab
    {
      sub_events: object.event_detail.sub_events.present? ? object.event_detail.sub_events : "",
      workshops: object.event_detail.workshops.present? ? object.event_detail.workshops : "",
      paper_presentation_topics: object.event_detail.paper_presentation_topics.present? ? object.event_detail.paper_presentation_topics : "",
      conference_topics: object.event_detail.conference_topics.present? ? object.event_detail.conference_topics : "",
    }
  end

  def register_tab
    {
     registration_open: object.event_detail.reg_start_date.present? ? object.event_detail.reg_start_date.to_s.split(' ')[0] : '',
     registration_close: object.event_detail.reg_end_date.present? ? object.event_detail.reg_end_date.to_s.split(' ')[0] : '', 
     fee: object.event_detail.reg_fee.present? ? object.event_detail.reg_fee.present? : ""
    }
  end

  def contact_tab
    {
      contact_details: contact_details
    }
  end

  def guest_speakers
    speakers = []
    object.event_guest_details.each do |guest|
      speakers << {
        name: guest.name.titleize,
        designation: guest.designation,
        company: guest.company,
        delegation: guest.delegation.titleize
        }   
    end  
    speakers
  end

  def contact_details
    contacts = []
    object.event_contact_details.each do |contact|
      contacts << {
        designation: contact.designation,
        name: contact.name.titleize,
        phone: contact.phone_no,
        email: contact.email,
        general_support: contact.general_support
        }   
    end  
    contacts
  end
end