class Mechanic < ApplicationRecord
  has_many :assignments
  has_many :rides, through: :assignments

  def self.avg_yrs_exp
    average(:years_experience)
  end
end
