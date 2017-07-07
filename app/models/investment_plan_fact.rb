class InvestmentPlanFact < ActiveRecord::Base
  belongs_to :investment

  validates :investment, presence: true
  validates :amount_plan, numericality: { greater_than:  0 }, presence: true
  validates :amount_fact, numericality: { greater_than:  0 }
  validates :period_number, numericality: { greater_than:  0 }, presence: true
end
