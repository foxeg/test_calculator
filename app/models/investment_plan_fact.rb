class InvestmentPlanFact < ActiveRecord::Base
  belongs_to :investment

  validates :investment, presence: true
  validates :amount_plan_principal, numericality: { greater_than:  0 }, presence: true
  validates :amount_plan_interest, numericality: { greater_than:  0 }, presence: true
  validates :amount_plan_payment, numericality: { greater_than:  0 }, presence: true
  validates :amount_fact, numericality: { greater_or_equal_than:  0 }, allow_nil: true
  validates :period_number, numericality: { greater_than:  0 }, presence: true, uniqueness: {scope: :investment_id}

  def amount_overdue
    (amount_plan_principal + investment.amount * investment.monthly_overdue_rate).ceil_to(2)
  end

  def amount_early
    remaining_principal = investment.investment_plan_facts.where('period_number > ?', period_number).sum(:amount_plan_principal)
    remaining_principal + amount_plan_payment
  end
end
