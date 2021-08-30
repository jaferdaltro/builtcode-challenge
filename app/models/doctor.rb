class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments

  validates :name, presence: true
  validates :crm, presence: true, uniqueness: { case_sensitive: false }
  validates :crm_uf, presence: true

  def crm_with_uf
    "#{crm}-#{crm-uf}"
  end
  

  def unavailable_dates
    appointments.pluck(:starts_at, :ends_at).map do |range|
      {from: range[0], to: range[1]}
    end
  end

  
  

end
