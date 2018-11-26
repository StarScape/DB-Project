class SpareKey < ApplicationRecord
  before_create :set_defaults

  private
  def set_defaults
    self.checked_out ||= false
  end
end
