module EventsHelper
  def disable_event_hide_btn event_id
    Event.find_by(id: event_id).is_published? ? "" : "disabled"
  end  

  def bookmark_text event, user
    event.event_bookmarks.find_by(user_id: user.id).try(:is_bookmarked) == true ? "Undo Bookmark" :
    "Bookmark It"
  end

  def bookmark_class event, user
    event.event_bookmarks.find_by(user_id: user.id).try(:is_bookmarked) == true ? "btn-danger" :
    "btn-success"
  end

  def bookmark_fa_icon event, user
    event.event_bookmarks.find_by(user_id: user.id).try(:is_bookmarked) == true ? "fa-bookmark" :
    "fa-bookmark-o"
  end
end
