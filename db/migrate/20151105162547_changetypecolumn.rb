class Changetypecolumn < ActiveRecord::Migration
  def change

    change_column :reports, :text1, :text
    change_column :reports, :text2, :text
    change_column :reports, :text3, :text
    change_column :reports, :text4, :text
    change_column :reports, :text5, :text
    change_column :reports, :text6, :text
    change_column :reports, :text7, :text
    change_column :reports, :text8, :text
    change_column :reports, :text9, :text
    change_column :reports, :text10, :text

  end
end
