class AddColumnToRecords < ActiveRecord::Migration
  def change

    add_column :records, :report_id, :integer

  end
end
