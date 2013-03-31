class AddSchoolColumnToNominee < ActiveRecord::Migration
  def change
    add_column :nominees, :school, :string
    add_column :nominees, :school_code, :integer
  end
end
