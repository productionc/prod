class InternshipsController < ApplicationController
 def index
    @internships = Internship.all.order("created_at DESC")
    @applied_internships = AppliedInternship.find_by(company_id: current_user.id).present? ?
     AppliedInternship.where(company_id: current_user.id) : []
  end

  def show
    @internship = Internship.find(params[:id])
  end

  def new
    authenticate_user!
    @internship = Internship.new
    @internship.build_job_type
    @internship.build_stipend_type
    @internship.build_stipend_amount
  end

  def create
  @internship = Internship.new(internship_params)
  @internship.user_id = current_user.id
  respond_to do |format|
    if @internship.save
      format.html { redirect_to internships_path, :notice => "Successfully created internship" }
      format.js 
    else
      format.html { render :action => 'new' }
      format.js { render :action => 'new' }
    end
  end
 end

  def edit
    @internship = Internship.find(params[:id])
  end

  def update
    @internship = Internship.find(params[:id])
    @internship.user_id = current_user.id
    respond_to do |format|
    if @internship.update_attributes(internship_params)
      format.html { redirect_to internships_path, :notice => "Successfully updated internship" }
      format.js 
    else
      format.html { render :action => 'edit' }
      format.js { render :action => 'edit' }
    end
  end
  end

  def show
    @internship = Internship.find(params[:id])
  end

  def apply_for_internship
    authenticate_user!
    AppliedInternship.create(company_id: params[:company_id],user_id: current_user.id, internship_id: params[:internship_id], internship_status: 'Submitted')
    redirect_to :back
  end

  def posted_internships
    @posted_internships = Internship.where(user_id: current_user.id)
  end

private

  def internship_params
    params.require(:internship).permit(:title, :no_of_openings, :category, :start_date, 
    :country, :state, :district, :job_type_id, :duration, :skills, :stipend_type_id,
    :stipend_amount_id, :certificate, :pre_placement, :description, :user_id,
    stipend_amount_attributes: [:amount, :amount_lower_limit, :amount_upper_limit, :incentive_amount,
    :incentive_type, :id]
    ).tap do |attributes|
        attributes[:start_date] = parse_time(attributes[:start_date])
    end
  end

  def parse_time time
    Time.zone.parse(DateTime.strptime(time,"%m/%d/%Y %I:%M %P").to_s) if time.present?
  end
end
