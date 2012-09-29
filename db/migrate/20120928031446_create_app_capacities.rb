class CreateAppCapacities < ActiveRecord::Migration
  def change
    create_table :app_capacities do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
