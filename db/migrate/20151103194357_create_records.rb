class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.datetime :fecha
      t.integer :estado

      t.timestamps
    end
  end
end
