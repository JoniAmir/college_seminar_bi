class AddSchoolColumnToNominee < ActiveRecord::Migration
  def change
    add_column :nominees, :school, :string
  end
end
