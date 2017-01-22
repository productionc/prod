class AdminsController < ApplicationController

  def collegeda_admins
  end

  def collegeda_users
    @users = User.all.order('created_at DESC')
  end

  def collegeda_events_moderation
  end

  def publish_event
    Event.find_by(id: params[:event_id]).update(is_published: true)
    redirect_to :back, notice: 'Event Published successfully !'
  end

  def events_subscriber
    @event_subscribers = EventSubscription.all.order('created_at DESC')
  end

  def events_action
    @all_events = Event.all.order('created_at DESC')
  end

end