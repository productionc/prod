class EventsDatatable
  delegate :params, :link_to, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Event.count,
      iTotalDisplayRecords: events.total_entries,
      aaData: data
    }
  end

private

  def data
    events.map do |event|
      [
        link_to(event.event_name, event),
        event.event_type,
        event.study_place,
        event.district
      ]
    end
  end

  def events
    @events ||= fetch_events
  end

  def fetch_events
    events = Event.order("#{sort_column} #{sort_direction}")
    events = events.page(page).per_page(per_page)
    if params[:sSearch].present?
      events = events.where("event_name ilike :search or event_type ilike :search
        or study_place ilike :search or district ilike :search", search: "%#{params[:sSearch]}%")
    end
    events
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[event_name event_type study_place district]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end