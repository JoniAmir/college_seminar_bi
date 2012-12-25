class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :year
      t.integer :semester
      t.integer :id_number
      t.date :birthdate
      t.string :city
      t.string :gender
      t.string :ba_degree
      t.string :ba_minor
      t.float :combined_grade
      t.string :institute
      t.float :coordinated_grade
      t.string :integrated_grade
      t.integer :sat_grade
      t.float :mehina_grade
      t.integer :english_level
      t.float :school_grade
      t.float :subject1_grade
      t.integer :subject1_units
      t.float :subject2_grade
      t.integer :subject2_units
      t.string :group_description
      t.integer :priority
      t.string :school
      t.string :curriculum
      t.integer :mazat

      t.timestamps
    end
  end
end
