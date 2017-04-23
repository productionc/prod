class Api::V1::EventsController < Api::V1::BaseController

  def events_list
    all_events = Event.joins(:event_departments, :event_college_banner, :event_detail).order("created_at desc")
    per_page = 10
    paginated_events = all_events.paginate(page: params[:page].to_i, per_page: per_page)
    total_entries = paginated_events.total_entries
    no_of_pages = total_entries/per_page
    has_more = paginated_events.current_page != paginated_events.total_pages && paginated_events.current_page <= paginated_events.total_pages
    code = paginated_events.count > 0 ? 200 : 400
    message = paginated_events.count > 0 ? "Successful" : "Unsuccessful"
    render json: paginated_events, each_serializer: Api::V1::Serializers::EventSerializer, root: 'events', meta: {status: code, message: message, has_more: has_more, per_page: per_page, no_of_pages: no_of_pages,total_entries: total_entries}
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
    event = event.uniq
    code = event.present? ? 200 : 400
    message = event.present? ? "Successful" : "Unsuccessful"
    if event.present?
     render json: event, each_serializer: Api::V1::Serializers::EventDetailSerializer, root: 'event', meta: {status: code, message: message }
   else
     render json: { meta: {status: code, message: message } }, root: 'event'
   end
  end

end
