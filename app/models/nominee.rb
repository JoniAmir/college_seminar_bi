# == Schema Information
#
# Table name: nominees
#
#  id                 :integer          not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  age                :integer
#  city               :string(255)
#  school_grade       :integer
#  math_units         :integer
#  math_grade         :integer
#  sat_grade          :integer
#  last_result_graphs :string(255)
#  english_units      :integer
#  english_grade      :integer
#

class Nominee < ActiveRecord::Base      
	attr_accessible :age, :gender, :gender_code, :city, :city_code, :school_grade, :sat_grade,
									:math_units, :math_grade, :english_units, :english_grade, :last_result_graphs, :starting_semester, :school, :school_code, :is_working, :english_level

  	validates :age, :sat_grade, :school_grade, :math_units, :math_grade, :english_units, :english_grade, :starting_semester, :is_working, :english_level,
  					:numericality => { :greater_than_or_equal_to => 0 }

	validates_presence_of :city, :gender, :school

end
