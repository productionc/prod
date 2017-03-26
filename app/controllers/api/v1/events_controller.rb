class Api::V1::EventsController < Api::V1::BaseController

  def events_list
    all_events = Event.joins(:event_departments, :event_college_banner, :event_detail).all.select(:id, :event_name,
      :study_place, :district, :state, :country, :event_type, :start_date, :end_date, :college_banner_file_name).order(:event_name)
    render json: { events: all_events }, status: 200
  end

  def events_count
    count = Event.count
    render json: { count: count }
  end

  def all_users_count
    count = User.count
    render json: { count: count }
  end

end
