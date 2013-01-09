class AddBasicsToNominees < ActiveRecord::Migration
  def change
    add_column :nominees, :age, :integer
    add_column :nominees, :city, :string
    add_column :nominees, :school_grade, :integer
    add_column :nominees, :math_units, :integer
    add_column :nominees, :grade, :integer
    add_column :nominees, :sat_grade, :integer
    add_column :nominees, :last_result_graphs, :string
  end
end
