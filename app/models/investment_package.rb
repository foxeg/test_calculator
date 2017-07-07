class InvestmentPackage < ActiveRecord::Base
  belongs_to :investor
  has_many :investments, dependent: :destroy

  validates :period, presence: true, numericality: { greater_than:  0 }
  validates :investor, presence: true
end
