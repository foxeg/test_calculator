class ChangeInvestmentPlanFact < ActiveRecord::Migration
  def change
    add_column :investment_plan_facts, :amount_plan_interest, :decimal, precision: 15, scale: 2
    add_column :investment_plan_facts, :amount_plan_principal, :decimal, precision: 15, scale: 2
    rename_column :investment_plan_facts, :amount_plan, :amount_plan_payment
  end
end
