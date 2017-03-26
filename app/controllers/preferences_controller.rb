class PreferencesController < ApplicationController

  def user_preference
    preference = Preference.find_by(user_id: current_user.id)
    if preference.present?
     @preference = preference
    else
     @preference = Preference.new
    end
  end

  private
  def preference_params
    params.require(:preference).permit(:preference_type_id, :user_id, :event_type)
  end

  def set_preference
    @preference = Preference.find(params[:id])
  end
end