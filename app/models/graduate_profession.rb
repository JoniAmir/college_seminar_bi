class GraduateProfession < ActiveRecord::Base
  attr_accessible :current_company, :current_job, :gender, :id_number, :marital_status, :number_of_children, :second_degree, :second_degree_institute, :second_degree_type, :third_degree_institute, :third_degree_type, :third_degree_years
end
