class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :school_purchases, :bandwith, :bandwidth
  end
end
