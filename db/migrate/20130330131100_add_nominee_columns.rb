class AddNomineeColumns < ActiveRecord::Migration
  def up
    add_column :nominees, :city_code, :integer    
    add_column :nominees, :gender_code, :integer
    add_column :nominees, :gender, :string 
    add_column :nominees, :starting_semester, :integer    
  end

  def down
    remove_column :nominees, :city_code
    remove_column :nominees, :gender_code
    remove_column :nominees, :gender
    remove_column :nominees, :starting_semester
  end
end
