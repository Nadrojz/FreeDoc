require 'faker'
# Supprime toutes les villes existantes et crée aléatoirement via la gem faker 10 noms de villes
City.destroy_all
10.times do
  City.create!(
    name: Faker::Address.city
    )
end

# Supprime tous les docteurs
Doctor.destroy_all
# Supprime tous les patients
Patient.destroy_all
#Va faire 50 fois les actions ci dessous
50.times do |index|
  # Créer un docteur
  d = Doctor.create
  #Donner un prénom au docteur
  d.first_name = Faker::Name.first_name
  #Donner un nom au docteur
  d.last_name = Faker::Name.last_name
  #Assigne au hasard au docteur une des spécialités contenues dans l'array
  d.specialty = (["Allergy", "Anesthesiology", "Dermatology", "Radiology", "Emergency medecine", "Generalist", "Internal medecine", "Neurology", "Nuclear medecine", "Gynecology", "Ophtalmology", "Pathology", "Pediatrics", "Physical medecine", "Preventive medecine", "Psychiatry", "Radiation oncology", "Surgery", "Urology"]).sample
  #Donner un zip_code
  d.zip_code = Faker::Address.zip_code
  #Donner au hasard une des villes
  d.city = City.order('RANDOM()').first
  #Sauvegarder les informations du docteur crée
  d.save
  #Créer un patient et lui donne un prénom, nom, ville et sauvegarde
  p = Patient.create
  p.first_name = Faker::Name.first_name
  p.last_name = Faker::Name.last_name
  p.city = City.order('RANDOM()').first
  p.save
end

#Supprime tous les rendez vous
Appointment.destroy_all
#Va faire 100 fois les actions ci dessous
100.times do
  #Créer un rendez vous
  Appointment.create!(
    #Lui assigner une date au hasard, à partir de maintenant jusqu'à 1 an dans le futur dans des horaires de journée et converti le string obtenu au format datetime
    date: Faker::Time.forward(days: 365, period: :day).to_datetime,
    #Assigne aléatoirement un docteur au rendez vous
    doctor: Doctor.order('RANDOM()').first,
    #Assigne aléatoirement un patient au rendez vous
    patient: Patient.order('RANDOM()').first,
    #Assigne aléatoirement une ville au rendez vous
    city: City.order('RANDOM()').first)
end
