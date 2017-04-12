class Api::V1::Serializers::EventDetailSerializer < ActiveModel::Serializer
  attributes :id, :event_name, :study_place, :district, :state, :country, :event_type, :start_date,
  :end_date, :event_icon_url, :going_count, :reach_count, :may_be_count, :no_of_days, :about_tab

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
      guest_speakers: guest_speakers
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
end