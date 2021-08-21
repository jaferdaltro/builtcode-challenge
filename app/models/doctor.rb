class Doctor < ApplicationRecord
  validates :name, presence: true
  validates :crm, presence: true, uniqueness: { case_sensitive: false }
  validates :crm_uf, presence: true

end
