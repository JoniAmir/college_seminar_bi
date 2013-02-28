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

require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
