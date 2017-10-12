class HealthCaresPatient < ApplicationRecord
  belongs_to :health_care
  belongs_to :patient

  scope :actives, -> { where(active: true) }

  validates :affiliate_no, uniqueness: { scope: [:health_care] }
  validates :health_care,  uniqueness: { scope: [:patient] }
  validates :active, uniqueness: { scope: [:patient] }, if: :active?
end
