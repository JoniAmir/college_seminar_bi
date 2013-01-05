class RenameColumnGraduateProfessions < ActiveRecord::Migration
  def up
  	rename_column(:graduate_professions, :second_degree, :second_degree_years)
  end

  def down
  	rename_column(:graduate_professions, :second_degree_years, :second_degree)
  end
end
