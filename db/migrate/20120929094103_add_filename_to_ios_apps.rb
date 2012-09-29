class AddFilenameToIosApps < ActiveRecord::Migration
  def change
    add_column :ios_apps, :filename, :string
  end
end
