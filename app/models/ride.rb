class Ride < ApplicationRecord
  has_many :assignments
  has_many :mechanics, through: :assignments
end
