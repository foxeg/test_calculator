class AddStatusToInvestment < ActiveRecord::Migration
  def change
    add_column :investments, :status, :string
  end
end
