class EventsController < ApplicationController
before_filter :set_event, only: [:show]
before_action :authenticate_user!, only: [:show, :new]

	def index
    if params[:utf8].present?

     query ||= []
     query << "event_type = '#{params[:event_type]}'" if params[:event_type].present?
     query << "country = '#{params[:country]}'" if params[:country].present?
     query << "state = '#{params[:state]}'" if params[:state].present?
     query << "district = '#{params[:city]}'" if params[:city].present?
     query << "event_details.start_date >= '#{Date.parse(params[:search_date]).beginning_of_day}'" if params[:search_date].present?

     @events = Event.joins(:event_detail).where(query.join(" AND ")).paginate(:page => params[:page], :per_page => 4).order("event_details.start_date ASC")
     # binding.pry
    else
     @events = Event.paginate(:page => params[:page], :per_page => 4).order("created_at DESC")
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
    event_id = @event.id
    user_id = current_user.id
    event_going = EventGoing.find_by(event_id: event_id, user_id: user_id)
    EventService.new().event_going_reach_count(event_going, event_id, user_id)
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

  def event_subscription
    if current_user
      @subscribe = EventSubscription.create(email_id: params[:subscribe_email], user_id: current_user.id)
      if @subscribe.present?
        redirect_to :back, notice: "Successfully you are subscribed !" 
      else
        redirect_to :back, notice: "Subscription failed !"
      end
    end
  end

  def event_going
   event_id = params[:event_id].to_i
   user_id = current_user.id
   event_going = EventGoing.find_by(event_id: event_id, user_id: user_id)
   redirect_to :back, notice: EventService.new().going_and_may_be_count(event_going, params)
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
      event_sponsors_attributes: [:sponsor, :id, :_destroy]
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