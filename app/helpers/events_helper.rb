module EventsHelper
  def disable_event_hide_btn event_id
    Event.find_by(id: event_id).is_published? ? "" : "disabled"
  end  
end
