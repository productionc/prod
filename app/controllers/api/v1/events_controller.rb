class Api::V1::EventsController < Api::V1::BaseController

  def events_list
    all_events = Event.joins(:event_departments, :event_college_banner, :event_detail)
    render json: all_events, each_serializer: Api::V1::Serializers::EventSerializer
  end

  def events_count
    count = Event.count
    render json: { count: count }
  end

  def all_users_count
    count = User.count
    render json: { count: count }
  end

  def event_detail
    event = Event.find_by_id(params[:event_id])
    if event.present?
     render json: event, each_serializer: Api::V1::Serializers::EventDetailSerializer
   else
     render json: { message: "Invalid event" }
   end
  end

end
