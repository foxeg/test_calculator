class CreateInvestmentPlanFacts < ActiveRecord::Migration
  def change
    create_table :investment_plan_facts do |t|
      t.references :investment, index: true, foreign_key: true
      t.decimal :amount_plan, :precision => 15, :scale => 2
      t.decimal :amount_fact, :precision => 15, :scale => 2
      t.integer :period_number

      t.timestamps null: false
    end
  end
end
