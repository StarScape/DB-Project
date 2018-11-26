class Reservation < ApplicationRecord
  belongs_to :student
  before_create :set_defaults

  private
  def set_defaults
    self.checked_in ||= false
  end
end
