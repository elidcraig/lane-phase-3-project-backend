class Host < ActiveRecord::Base
  has_many :vehicles
  has_many :reservations, through: :vehicles
end