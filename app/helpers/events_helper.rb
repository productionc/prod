module EventsHelper
  def disable_event_hide_btn event_id
    Event.find_by(id: event_id).is_published? ? "" : "disabled"
  end  

  def favourite_text event, user
    event.event_favourites.find_by(user_id: user.id).try(:is_favourite) == true ? "Remove from favourite" :
    "Add to favourite"
  end

  def favourite_class event, user
    event.event_favourites.find_by(user_id: user.id).try(:is_favourite) == true ? "btn-danger" :
    "btn-success"
  end

  def favourite_fa_icon event, user
    event.event_favourites.find_by(user_id: user.id).try(:is_favourite) == true ? "fa-heart" :
    "fa-heart-o"
  end
end
