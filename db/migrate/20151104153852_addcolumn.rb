class Addcolumn < ActiveRecord::Migration
  def change
    add_column :reports, :file, :string
    rename_column :reports, :fecha, :nombre

  end
end
