class Doctor < ApplicationRecord
  has_many :appointments, dependent: :restrict_with_error
  has_many :patients, through: :appointments
  has_many :doctor_specialties
  has_many :specialties, through: :doctor_specialties

  validates :name, presence: true
  validates :crm, presence: true, uniqueness: { case_sensitive: false }
  validates :crm_uf, presence: true

  def crm_with_uf
    "#{crm}-#{crm_uf}"
  end

  def unavailable_dates
    appointments.pluck(:starts_at, :ends_at).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
