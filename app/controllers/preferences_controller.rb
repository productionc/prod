class PreferencesController < ApplicationController
  before_filter :set_preference, only: [:edit, :update]

  def new
    @preference = Preference.new
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
    params.require(:preference).permit(:preference_type_id, :user_id, :event_type)
  end

  def set_preference
    @preference = Preference.find(params[:id])
  end
end