class AddAverageCostToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :average_cost, :float
  end
end
