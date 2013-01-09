# == Schema Information
#
# Table name: graduate_professions
#
#  id                      :integer          not null, primary key
#  id_number               :integer
#  gender                  :string(255)
#  marital_status          :string(255)
#  number_of_children      :integer
#  second_degree_institute :string(255)
#  second_degree_years     :string(255)
#  second_degree_type      :string(255)
#  third_degree_institute  :string(255)
#  third_degree_years      :string(255)
#  third_degree_type       :string(255)
#  current_job             :string(255)
#  current_company         :string(255)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class GraduateProfession < ActiveRecord::Base
  attr_accessible :current_company, 
  				  :current_job, 
  				  :gender, 
  				  :id_number, 
  				  :marital_status, 
  				  :number_of_children, 
  				  :second_degree_years, 
  				  :second_degree_institute, 
  				  :second_degree_type, 
  				  :third_degree_institute, 
  				  :third_degree_type, 
  				  :third_degree_years
end
