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
    publish_msg(params[:event_id])
    redirect_to :back, flash: { success: 'Event Published successfully !' }
  end

  def publish_msg event_id
    begin
      Pusher.trigger('my-channel', 'my-event', {
        message: event_id
      })
    rescue Pusher::Error => e
      Rails.logger.error "Pusher error: #{e.message}"
    end
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