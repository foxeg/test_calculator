class Investment < ActiveRecord::Base
  STATUSES = %W(new payed)

  belongs_to :lendee
  belongs_to :investment_package
  has_many :investment_plan_facts, dependent: :destroy
  accepts_nested_attributes_for :investment_plan_facts, reject_if: :all_blank, allow_destroy: false

  validates :lendee, uniqueness: { scope: :investment_package_id }
  validates :base_rate, numericality: { greater_than:  0 }, presence: true
  validates :overdue_rate, numericality: { greater_than:  0 }, presence: true
  validates :amount, numericality: { greater_than:  0 }, presence: true
  validates :status, inclusion: { in: STATUSES }

  delegate :period, to: :investment_package

  after_create :calculate_plan

  def calculate_plan
    raw_monthly_principal = amount.to_f / period
    raw_payment =  amount.to_f * (1 + monthly_base_rate * period)
    remaining_payment = raw_payment.ceil_to(2)
    raw_monthly_payment = raw_payment / period
    monthly_payment = raw_monthly_payment.ceil_to(2) # to kopek, round up to make first payment bigger than last
    monthly_principal = raw_monthly_principal.ceil_to(2) # to kopek, round up to make first payment bigger than last
    monthly_interest = (monthly_payment - monthly_principal).round_to(2) # to avoid floating precision

    remaining_amount = amount
    (period - 1).times do |p|
      investment_plan_facts.create(period_number: p+1, amount_plan_principal: monthly_principal, amount_plan_interest: monthly_interest, amount_plan_payment: monthly_payment)
      remaining_amount -= monthly_principal
      remaining_payment -= monthly_payment
    end
    investment_plan_facts.create(period_number: period, amount_plan_principal: remaining_amount, amount_plan_interest: remaining_payment - remaining_amount, amount_plan_payment: remaining_payment)
  end

  def payed?
    status == "payed"
  end

  def update_status
    # TODO check if fact payments filled principal amount 
    unless investment_plan_facts.where(amount_fact: nil).any?
      self.status = "payed" 
      self.save
    end
  end

  def monthly_base_rate
    base_rate.to_f / (12 * 100)
  end

  def monthly_overdue_rate
    overdue_rate.to_f / (12 * 100)
  end
end
