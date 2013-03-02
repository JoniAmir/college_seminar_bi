class AddColumnsToNominees < ActiveRecord::Migration
  def up
    rename_column :nominees, :grade, :math_grade
    add_column :nominees, :english_units, :integer
    add_column :nominees, :english_grade, :integer
  end

  def down
    rename_column :nominees, :math_grade, :grade
    remove_column :nominees, :english_units
    remove_column :nominees, :english_grade
  end
end
