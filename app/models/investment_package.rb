class InvestmentPackage < ActiveRecord::Base
  belongs_to :investor
  has_many :investments, dependent: :destroy
  accepts_nested_attributes_for :investments, reject_if: :all_blank, allow_destroy: true

  validates :period, presence: true, numericality: { greater_than:  0 }
  validates :investor, presence: true
  #validates :investments, length: { minimum: 1 }

  def plan_rate
    (investments.map{|i| i.investment_plan_facts.sum(:amount_plan_interest)}.sum.to_f / investments.sum(:amount)) * 12 * 100 / period
  end

  def fact_rate
    ((investments.map{|i| i.investment_plan_facts.sum(:amount_fact)}.sum.to_f / investments.sum(:amount)) - 1) * 12 * 100 / period
  end

  def payed?
    !investments.where.not(status: "payed").any?
  end

  def amount
    investments.sum(:amount)
  end
end
