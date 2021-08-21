class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments

  validates :name, presence: true
  validates :crm, presence: true, uniqueness: { case_sensitive: false }
  validates :crm_uf, presence: true

end
