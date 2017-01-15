namespace :load_event_data do
  desc "load event data"
  task registration_types: :environment do
    registration_type_data
  end

  task event_extras: :environment do
    event_extra_data
  end

  task event_departments: :environment do
    event_department_data
  end

  def registration_type_data
   types = ["Student-Studying", "Student-Passout", "Teacher", "Employer"]
   types.each do |item|
     RegistrationType.create(name: item)
   end
  end

  def event_extra_data
    data = ["Sponsors", "Workshops", "Celebrities"]
    data.each do |item|
      EventExtra.create(name: item)
    end
  end

  def event_department_data
    data = ["Art & Design as Major",
    "English Language & Literature",
    "Economics as Major",
    "Commerce as Major",
    "History as Major",
    "Linguistics as Major",
    "Modern Languages as Major",
    "Performing Arts as Major",
    "Philosophy as Major",
    "Agriculture & Forestry as Major",
    "Biological Sciences as Major",
    "Dentistry as Major",
    "Medicine",
    "Nursing as Major",
    "Pharmacy & Pharmacology as Major",
    "Psychology as Major",
    "Veterinary Science as Major",
    "Aerospace/Aeronautical as Major",
    "Agricultural as Major",
    "Apparel as Major",
    "Audio as Major",
    "Automotive as Major",
    "Biomedical as Major",
    "Bio-Tech as Major",
    "Chemical as Major",
    "Civil as Major",
    "Genetics as Major",
    "Computer science as Major",
    "Ceramic as Major",
    "Electronics as Major",
    "Electrical as Major",
    "Environmental as Major",
    "Food Tech as Major",
    "Fashion Tech as Major",
    "Geo -informatics",
    "Intrumentation as Major",
    "Industrial Tech",
    "Leather Tech",
    "Material Science as Major",
    "Medical Electronics",
    "Mechanical as Major",
    "Mining as Major",
    "Manufacturing as Major",
    "Marine as Major",
    "Metallurgical as Major",
    "Nuclear as Major",
    "Plastic Tech",
    "Petro Chemical as Major",
    "Pharma as Major",
    "Polymer Tech",
    "Production as Major",
    "Printing as Major",
    "Robotics as Major",
    "Rubber and Plastic",
    "Textile Tech",
    "Software as Major",
    "Law"
    ]
    data.each do |item|
      EventDepartment.create(name: item)
    end
  end

end
