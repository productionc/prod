class AdminsController < ApplicationController

  def collegeda_admins
  end

  def collegeda_users
  end

  def collegeda_events_moderation
  end

  def publish_event
    Event.find_by(id: params[:event_id]).update(is_published: true)
    redirect_to :back, notice: 'Event Published successfully !'
  end

end