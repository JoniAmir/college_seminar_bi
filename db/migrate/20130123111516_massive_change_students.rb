class MassiveChangeStudents < ActiveRecord::Migration
  def up
  	#add_column :students, :gender_code, :integer
  	#remove_column :students, :ba_minor
  	#remove_column :students, :ba_degree
  	#remove_column :students, :combined_grade
  	#remove_column :students, :institute
  	#add_column :students, :group_description_code, :integer 
  	#add_column :students, :school_code, :integer
  	add_column :students, :curriculum_code, :integer
  	add_column :students, :mazat_code, :integer 
  	add_column :students, :mazat_display, :string
  end

  def down
  	#remove_column :students, :gender_code
  	#add_column :students, :ba_minor, :string
  	#add_column :students, :ba_degree, :string
  	#add_column :students, :combined_grade, :float
  	#add_column :students, :institute, :string
  	#remove_column :students, :group_description_code
  	#remove_column :students, :school_code
  	remove_column :students, :curriculum_code
  	remove_column :students, :mazat_code
  	remove_column :students, :mazat_display
  end
end