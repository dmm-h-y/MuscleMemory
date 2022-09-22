class AddRateToMuscles < ActiveRecord::Migration[6.1]
  def change
    add_column :muscles, :rate, :float
  end
end
