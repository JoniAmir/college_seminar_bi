class CreateGraduates < ActiveRecord::Migration
  def change
    create_table :graduates do |t|
      t.integer :id_number
      t.string :curriculum
      t.integer :curriculum_id
      t.date :graduation_ceremony_date
      t.date :graduation_date
      t.integer :final_grade
      t.integer :ranking
      t.integer :ranking_total
      t.string :gender

      t.timestamps
    end
  end
end
