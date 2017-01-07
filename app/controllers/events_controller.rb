class EventsController < ApplicationController
before_filter :set_event, only: [:show]
before_action :authenticate_user!, only: [:show, :new]

	def index
		if true
     @events = Event.where(country: 'India').paginate(:page => params[:page], :per_page => 2).order("created_at DESC")
     # binding.pry
    else
     @events = Event.paginate(:page => params[:page], :per_page => 1).order("created_at DESC")
    end
	end

	def new
		@event = Event.new
		@event.build_event_detail
		@event.build_event_url
    @event.build_event_accomodation
    @event.build_event_banner
    @event.build_event_college_banner
    @event.build_event_broucher
    @event.build_event_sponsor
	end

	def create
		@event = Event.new(event_params)
  	if @event.save
  		redirect_to @event, notice: "Successfully created event"
  	else
  		render 'new'
  	end
	end

	def show
	end

  def welcome
  end

  def states
    render json: CS.states(params[:country]).to_json
  end

  def cities
    render json: CS.cities(params[:state], params[:country]).to_json
  end

  def get_event_results
    @results = Event.where(country: params[:query]).paginate(:page => params[:page], :per_page => 2).order("created_at DESC")
    render json: @results.to_json
  end

	private

  def event_params
		params.require(:event).permit(:first_name, :last_name, :email, :phone_no, 
			:event_name, :event_type, :study_place, :country, :state, :district, :zip,
			:location, :event_detail_id, :id, 
			event_detail_attributes: [:start_date, :end_date,
			 :event_description, :sub_events, :workshops, :paper_presentation_topics, :conference_topics, :reg_start_date, :reg_end_date, :reg_fee, :id],
			event_department_ids: [],
			event_contact_details_attributes: [:designation, :name, :email, :phone_no, :general_support, :id, :_destroy],
			event_guest_details_attributes: [:name, :designation, :company, :delegation, :id, :_destroy],
			event_url_attributes: [:web_link, :registration_link, :college_link, :facebook_link, :twitter_link, :youtube_link, :apps_link, :id],
      event_extra_ids: [],
      event_accomodation_attributes: [:accomodation, :id],
      event_banner_attributes: [:banner, :id],
      event_college_banner_attributes: [:college_banner, :id],
      event_broucher_attributes: [:broucher, :id],
      event_sponsor_attributes: [:sponsor, :id]
			).tap do |attributes|
				attributes[:event_detail_attributes][:start_date] = parse_time(attributes[:event_detail_attributes][:start_date]) if attributes[:event_detail_attributes].present?
				attributes[:event_detail_attributes][:end_date] = parse_time(attributes[:event_detail_attributes][:end_date]) if attributes[:event_detail_attributes].present?
				attributes[:event_registration_attributes][:start_date] = parse_time(attributes[:event_registration_attributes][:start_date]) if attributes[:event_registration_attributes].present?
				attributes[:event_registration_attributes][:end_date] = parse_time(attributes[:event_registration_attributes][:end_date]) if attributes[:event_registration_attributes].present?
		end
  end

  def parse_time time
    Time.zone.parse(time).utc if time.present?
  end

  def set_event
  	@event = Event.find(params[:id])
  end

end