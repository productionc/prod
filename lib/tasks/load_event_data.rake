namespace :load_event_data do
  desc "load event data"
  task registration_types: :environment do
    registration_type_data
  end

  def registration_type_data
   types = ["Student-Studying", "Student-Passout", "Teacher", "Employer"]
   types.each do |item|
     RegistrationType.create(name: item)
   end
  end

end
