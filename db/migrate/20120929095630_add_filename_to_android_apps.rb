class AddFilenameToAndroidApps < ActiveRecord::Migration
  def change
    add_column :android_apps, :filename, :string
  end
end
