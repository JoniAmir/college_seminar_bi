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
  attr_accessible :ba_degree, 
  							  :ba_minor, 
  							  :birthdate,
  							  :city, 
  							  :combined_grade, 
  							  :coordinated_grade, 
  							  :curriculum, 
  							  :english_level, 
  							  :gender, 
  							  :group_description, 
  							  :id_number, 
  							  :institute, 
  							  :integrated_grade, 
  							  :mazat, 
  							  :mehina_grade, 
  							  :sat_grade, 
  							  :school, 
  							  :school_grade, 
  							  :semester, 
  							  :subject1_grade, 
  							  :subject2_grade, 
  							  :subject1_units, 
  							  :subject2_units, 
  							  :year, 
  							  :priority
end
