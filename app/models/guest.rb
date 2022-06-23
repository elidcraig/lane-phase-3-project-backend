class Guest < ActiveRecord::Base

  def self.is_existing_user? username
    self.find_by :username => username
  end

  def self.log_in_new_user username
    inactive_user = self.find_by :logged_in => true
    if inactive_user
      inactive_user.update logged_in: false
    end
    active_user = self.find_by :username => username
    active_user.update logged_in: true
  end

  def self.find_logged_in_user
    active_user = self.find_by :logged_in => true
  end

  has_many :reservations
  has_many :vehicles, through: :reservations

end