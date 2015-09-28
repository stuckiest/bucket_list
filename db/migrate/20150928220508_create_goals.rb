class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title
      t.string :description
      t.string :location
      t.boolean :completed, default: false
      t.belongs_to :user
      t.string :type, default: [],  array: true
      t.string :category


      t.timestamps null: false
    end
  end
end
