class Ride < ApplicationRecord
  has_many :assignments
  has_many :mechanics, through: :assignments
  belongs_to :park

  def self.open_by_thrill
    where(open: true).order(thrill_rating: :desc)
  end

  def self.alpha
    order(:name)
  end

  def self.avg_thrill
    average(:thrill_rating)
  end
end
