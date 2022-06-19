class Vehicle < ActiveRecord::Base
  belongs_to :host
  has_many :reservations
  has_many :guests, through: :reservations
end