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

  task event_types: :environment  do
    event_type_data
  end

  task event_department_stream: :environment do
    event_department_stream_data
  end

  task preference_type: :environment do
    preference_type_data
  end

  task notification_type: :environment do
    notification_type_data
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
    data = [["Art & Design as Major",0],
["English Language & Literature",0],
["Economics as Major",0],
["Commerce as Major",0],
["History as Major",0],
["Linguistics as Major",0],
["Modern Languages as Major",0],
["Performing Arts as Major",0],
["Philosophy as Major",0],
["Agriculture & Forestry as Major",0],
["Physics as Major",1],
["Chemistry as Major",1],
["Mathametics as Major",1],
["Biological Sciences as Major",2],
["Nursing as Major",3],
["Pharmacy & Pharmacology as Major",3],
["Psychology as Major",2],
["Aerospace/Aeronautical as Major",2],
["Agricultural as Major",2],
["Apparel as Major",2],
["Audio as Major",2],
["Automotive as Major",2],
["Biomedical as Major",2],
["Bio-Tech as Major",2],
["Chemical as Major",2],
["Civil as Major",2],
["Genetics as Major",2],
["Computer science as Major",2],
["Ceramic as Major",2],
["Electronics as Major",2],
["Electrical as Major",2],
["Environmental as Major",2],
["Food Tech as Major",2],
["Fashion Tech as Major",2],
["Geo -informatics",2],
["Intrumentation as Major",2],
["Industrial Tech",2],
["Leather Tech",2],
["Material Science as Major",2],
["Medical Electronics",2],
["Mechanical as Major",2],
["Mining as Major",2],
["Manufacturing as Major",2],
["Marine as Major",2],
["Metallurgical as Major",2],
["Nuclear as Major",2],
["Plastic Tech",2],
["Petro Chemical as Major",2],
["Pharma as Major",2],
["Polymer Tech",2],
["Production as Major",2],
["Printing as Major",2],
["Robotics as Major",2],
["Rubber and Plastic",2],
["Textile Tech",2],
["Software as Major",2],
["Anesthesiology",3],
["Anatomy",3],
["Aviation Medicine",3],
["Bio-Chemisty",3],
["Bio-Physics",3],
["Cardiology",3],
["Cardio Thoracic Surgery",3],
["Clinical Haematology",3],
["Clinical Pharmacology",3],
["Community Medicine",3],
["Dermatology",3],
["Dermatology & Venerology",3],
["Dermatology, Venerology & Leprosy",3],
["Ent",3],
["Endocrinology",3],
["Forensic Medicine",3],
["Gastroenterology",3],
["General Medicine",3 ],
["General Surgery",3],
["Geriatrics",3],
["Gi Surgery",3],
["Health Administration",3],
["Hospital Administration",3],
["Lab Medicine",3 ],
["Microbiology",3],
["Neonatology",3],
["Nephrology",3],
["Neurology",3],
["Neuro Radiology",3],
["Nuclear Medicine",3],
["Obstetrics & Gynaecology",3],
["Opthalmology ",3],
["Orthopaedics",3],
["Oncology",3],
["Paediatrics",3],
["Pulmonary Medicine",3],
["Pathology ",3],
["Pharmacology",3],
["Physical Medicine & Rehabilitation",3],
["Physiology",3],
["Plastic Surgery",3],
["Radiology",3],
["Rheumatology",3],
["Radio Diagnosis",3],
["Radiotherapy ",3],
["R & D",3],
["Social & Preventive Medicine",3],
["Tuberclosis & Respiratory Diseases",3],
["Venerology",3],
["Urology",3],
["Conservative Dentistry & Endodontics",4],
["Orthodontics",4],
["Oral & Maxillofacial Surgery",4],
["Prosthodontics",4],
["Pedodontics",4],
["Periodontics",4],
["Preventive & Community Dentistry",4],
["Oral Medicine and Radiology",4],
["Oral Pathology",4],
["Veterinary Science as Major",5],
["Law",6]
]
    data.each do |item|
      EventDepartment.create(name: item[0], stream_id: item[1]+1)
    end
  end

  def event_type_data
    data = ["Technical Event", "Symposium", "Cultural Event", "Management Event", 
      "Literary Event", "Sports Event", "Conference", "Online Event", "Seminar", "Workshops", "Faculty Development Program", "IEEE Conference"]
    data.each do |item|
      EventType.create(name: item)
    end
  end

  def event_department_stream_data
    data = ["Arts","Science","Engineering","Medicine","Dentistry","Veterinary","Law"] 
    data.each do |item|
      EventDepartmentStream.create(name: item)
    end
  end

  def preference_type_data
    PreferenceType.create(name: "Event")
  end

  def notification_type_data
    NotificationType.create(name: "Event")
  end

end
