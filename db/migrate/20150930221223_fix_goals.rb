class FixGoals < ActiveRecord::Migration
  def change
    remove_column :goals, :type
    change_column :goals, :category, :text, default: []
  end
end
