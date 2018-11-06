class Student < ApplicationRecord
  before_create :set_defaults

  def self.search(search)
    if search
      where('lname LIKE ?', "%#{search}%")
    end
  end

  private
  def set_defaults
    self.pname ||= self.fname;
  end
end
