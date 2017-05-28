module InternshipsHelper
  def check_internship_apply internship_id
    AppliedInternship.where(internship: internship_id, user_id: current_user.id).present? ? true : false
  end  
end