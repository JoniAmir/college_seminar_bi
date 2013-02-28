# == Schema Information
#
# Table name: students
#
#  id                :integer          not null, primary key
#  year              :integer
#  semester          :integer
#  id_number         :integer
#  birthdate         :date
#  city              :string(255)
#  gender            :string(255)
#  ba_degree         :string(255)
#  ba_minor          :string(255)
#  combined_grade    :float
#  institute         :string(255)
#  coordinated_grade :float
#  integrated_grade  :string(255)
#  sat_grade         :integer
#  mehina_grade      :float
#  english_level     :integer
#  school_grade      :float
#  subject1_grade    :float
#  subject1_units    :integer
#  subject2_grade    :float
#  subject2_units    :integer
#  group_description :string(255)
#  priority          :integer
#  school            :string(255)
#  curriculum        :string(255)
#  mazat             :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Student < ActiveRecord::Base
  attr_accessible :year, 
  							  :semester, 
                  :id_number,
  							  :birthdate,
  							  :city,
                  :city_code,
                  :gender, 
                  :gender_code,
                  :coordinated_grade, 
  							  :integrated_grade, 
                  :sat_grade,
                  :mehina_grade,  
                  :english_level, 
                  :school_grade, 
                  :subject1_grade, 
                  :subject1_units, 
                  :subject2_grade, 
                  :subject2_units, 
                  :group_description,
                  :group_description_code,
                  :priority,
                  :school, 
                  :school_code, 
  							  :curriculum, 
                  :curriculum_code,
                  :mazat, 
                  :mazat_code, 
                  :mazat_display
end