class Investor < ActiveRecord::Base
  has_many :investment_packages, dependent: :destroy
  has_many :investments, through: :investment_packages

  validates :name, presence: true, uniqueness: true
end
