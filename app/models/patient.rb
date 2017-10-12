class Patient < ApplicationRecord
  has_many :health_cares, through: :health_cares_patients
  has_many :health_cares_patients, inverse_of: :patient, dependent: :destroy

  validates :first_name, presence: true
  validates :surname, presence: true
  validates :dni, presence: true, if: Proc.new { |p| p.cuil.blank? && p.cuit.blank? }
  validates :dni, numericality: { only_integer: true, allow_nil: true }, if: :dni?
  validates :cuil, presence: true, if: Proc.new { |p| p.dni.blank? && p.cuit.blank? }
  validates :cuil, numericality: { only_integer: true, allow_nil: true }, if: :cuil?
  validates :cuit, presence: true, if: Proc.new { |p| p.dni.blank? && p.cuil.blank? }
  validates :cuit, numericality: { only_integer: true, allow_nil: true }, if: :cuit?

  accepts_nested_attributes_for :health_cares_patients

  def display_name
    [first_name, last_name, surname].join(' ')
  end

  def active_health_care
    health_cares_patients.actives.first&.health_care
  end

  def affiliate_no_for(health_care)
    health_cares_patients.find_by(health_care: health_care)&.affiliate_no
  end
end
