class HealthCare < ApplicationRecord
  has_many :patients, through: :health_cares_patients
  has_many :health_cares_patients

  def display_name
    code
  end
end
