class Ride < ApplicationRecord
  has_many :assignments
  has_many :mechanics, through: :assignments
  belongs_to :park

  def self.open_by_thrill
    where(open: true).order(thrill_rating: :desc)
  end
end
