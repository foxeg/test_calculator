class Investment < ActiveRecord::Base
  belongs_to :lendee
  belongs_to :investment_package

  validates :lendee, presence: true
  validates :investment_package, presence: true
  validates :base_rate, numericality: { greater_than:  0 }, presence: true
  validates :overdue_rate, numericality: { greater_than:  0 }, presence: true
  validates :amount, numericality: { greater_than:  0 }, presence: true
end
