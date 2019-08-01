class Doctor < ApplicationRecord
  has_many :appointments
  # has_many :specialties
  has_many :patients, through: :appointments
  belongs_to :city, optional: true
end
