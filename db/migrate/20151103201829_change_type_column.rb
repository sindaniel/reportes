class ChangeTypeColumn < ActiveRecord::Migration
  def change
    change_column :reports, :fecha, :string
  end
end
