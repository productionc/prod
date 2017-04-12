class AdminsController < ApplicationController

  def collegeda_admins
  end

  def collegeda_users
    authenticate_user!
    @users = User.all.order('created_at DESC')
  end

  def collegeda_events_moderation
    authenticate_user!
  end

  def publish_event
    Event.find_by(id: params[:event_id]).update(is_published: true)
    redirect_to :back, flash: { success: 'Event Published successfully !' }
  end

  def events_subscriber
    authenticate_user!
    @event_subscribers = EventSubscription.all.order('created_at DESC')
  end

  def events_action
    authenticate_user!
    @all_events = Event.all.order('created_at DESC')
  end

  def hide_events
    Event.find_by(id: params[:event_id]).update(is_published: false)
    redirect_to :back, flash: { success: 'Event has been hidden successfully !' }
  end

end