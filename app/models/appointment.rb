class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  validates :starts_at, :ends_at, presence: true, vacantness: true

  before_save :default_end

  private
  
  def default_end
    ends_at ||= starts_at + 30.minutes
  end

  def ends_after_starts
    return if ends_at.blank? || starts_at.blank?

    if ends_at < starts_at
      errors.add(:ends_at, "Deve ser depois do início")
    end
  end


end
