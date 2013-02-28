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

require 'test_helper'

class NomineeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
