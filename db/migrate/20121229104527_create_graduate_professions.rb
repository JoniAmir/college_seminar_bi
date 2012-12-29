class CreateGraduateProfessions < ActiveRecord::Migration
  def change
    create_table :graduate_professions do |t|
      t.integer :id_number
      t.string :gender
      t.string :marital_status
      t.integer :number_of_children
      t.string :second_degree_institute
      t.string :second_degree
      t.string :second_degree_type
      t.string :third_degree_institute
      t.string :third_degree_years
      t.string :third_degree_type
      t.string :current_job
      t.string :current_company

      t.timestamps
    end
  end
end
