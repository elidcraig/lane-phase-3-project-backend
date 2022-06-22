class Guest < ActiveRecord::Base

  def self.is_existing_user? username
    self.find_by :username => username
  end

  has_many :reservations
  has_many :vehicles, through: :reservations

end