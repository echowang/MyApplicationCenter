class CreateAndroidApps < ActiveRecord::Migration
  def change
    create_table :android_apps do |t|
      t.string :name
      t.text :description
      t.integer :capacity

      t.timestamps
    end
  end
end
