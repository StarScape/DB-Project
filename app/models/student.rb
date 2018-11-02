class Student < ApplicationRecord
  before_create :set_defaults

  private
  def set_defaults
    self.pname ||= self.fname;
  end
end
