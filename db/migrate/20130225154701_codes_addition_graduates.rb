class CodesAdditionGraduates < ActiveRecord::Migration
  
  def up
  	add_column :graduates, :gender_code, :integer
  	rename_column :graduates, :curriculum_id, :curriculum_code 

  	
  end

  def down
  	remove_column :graduates, :gender_code
  	rename_column :graduates, :curriculum_code, :curriculum_id 
  end

end