class AddTotalToRegistrations < ActiveRecord::Migration[5.0]
  def change
    add_column :registrations, :total, :decimal
  end
end
