class AddPortionOfAverageToSchoolPurchases < ActiveRecord::Migration
  def change
    add_column :school_purchases, :portion_of_average, :float    
  end
end
