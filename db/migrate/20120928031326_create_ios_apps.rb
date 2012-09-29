class CreateIosApps < ActiveRecord::Migration
  def change
    create_table :ios_apps do |t|
      t.string :name
      t.text :description
      t.integer :capacity

      t.timestamps
    end
  end
end
