class AddIsWorkingColumnToNominee < ActiveRecord::Migration
  def change
    add_column :nominees, :is_working, :integer
    add_column :nominees, :english_level, :integer
  end
end