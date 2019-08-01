# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

City.destroy_all
10.times do
  City.create!(
    name: Faker::Address.city
    )
end

Doctor.destroy_all
Patient.destroy_all
50.times do |index|
  d = Doctor.create
  d.first_name = Faker::Name.first_name
  d.last_name = Faker::Name.last_name
  d.specialty = (["Allergy", "Anesthesiology", "Dermatology", "Radiology", "Emergency medecine", "Generalist", "Internal medecine", "Neurology", "Nuclear medecine", "Gynecology", "Ophtalmology", "Pathology", "Pediatrics", "Physical medecine", "Preventive medecine", "Psychiatry", "Radiation oncology", "Surgery", "Urology"]).sample
  d.zip_code = Faker::Address.zip_code
  d.city = City.order('RANDOM()').first
  d.save
  p = Patient.create
  p.first_name = Faker::Name.first_name
  p.last_name = Faker::Name.last_name
  p.city = City.order('RANDOM()').first
  p.save

end

Appointment.destroy_all
100.times do
  Appointment.create!(
    date: Faker::Time.forward(days: 365, period: :day).to_datetime,
    doctor: Doctor.order('RANDOM()').first,
    patient: Patient.order('RANDOM()').first,
    city: City.order('RANDOM()').first)
end
