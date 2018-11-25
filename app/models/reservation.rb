class Reservation < ApplicationRecord
  before_create :set_defaults

  private
  def set_defaults
    self.checked_in ||= false
  end
end
