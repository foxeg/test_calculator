class CreateInvestmentPackages < ActiveRecord::Migration
  def change
    create_table :investment_packages do |t|
      t.integer :period
      t.references :investor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
