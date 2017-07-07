class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.references :lendee, index: true, foreign_key: true
      t.references :investment_package, index: true, foreign_key: true
      t.decimal :amount, :precision => 15, :scale => 2
      t.float :base_rate
      t.float :overdue_rate

      t.timestamps null: false
    end
  end
end
