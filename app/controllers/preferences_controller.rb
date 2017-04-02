class PreferencesController < ApplicationController
  
  before_filter :set_preference, only: [:edit, :update]
  
  def event_preference
    preference = Preference.find_by(user_id: current_user.id)
    if preference.present?
     @preference = preference
    else
     @preference = Preference.new
    end
  end

  def create
    @preference = Preference.new(preference_params)
    if @preference.save
      redirect_to events_path, flash: { success: "Successfully created preference" }
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @preference.update(preference_params)
      redirect_to events_path, flash: { success: "Successfully updated preference" }
    else
      render 'edit'
    end
  end

  private
  def preference_params
    params.require(:preference).permit(:preference_type_id, :stream_preference, :user_id, 
      location_preferences_attributes: [:country, :state, :district, :id, :_destroy],
      event_type_ids: [],
      event_department_ids: [])
  end

  def set_preference
    @preference = Preference.find(params[:id])
  end

end