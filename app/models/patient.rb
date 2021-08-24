class Patient < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments

  validates :name, presence: true
  validates :birth_date, presence: true
  validates :cpf, presence: true, uniqueness: { case_sensitive: false }

  validates_cpf_format_of :cpf
  

end
