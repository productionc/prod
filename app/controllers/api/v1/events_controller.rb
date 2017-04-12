class Api::V1::EventsController < Api::V1::BaseController

  def events_list
    all_events = Event.joins(:event_departments, :event_college_banner, :event_detail).order("created_at desc")
    paginated_events = all_events.paginate(page: params[:page].to_i, per_page: 10)
    total_entries = paginated_events.total_entries
    has_more = paginated_events.current_page != paginated_events.total_pages && paginated_events.current_page <= paginated_events.total_pages
    render json: paginated_events, each_serializer: Api::V1::Serializers::EventSerializer, root: 'events', meta: {has_more: has_more, total_entries: total_entries}, status: 200
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
    event = Event.joins(:event_departments, :event_college_banner, :event_detail).where("events.id = #{params[:event_id]}")
    if event.present?
     render json: event, each_serializer: Api::V1::Serializers::EventDetailSerializer, root: 'event'
   else
     render json: { message: "Invalid event" }
   end
  end

end
