# == Schema Information
#
# Table name: graduates
#
#  id                       :integer          not null, primary key
#  id_number                :integer
#  curriculum               :string(255)
#  curriculum_id            :integer
#  graduation_ceremony_date :date
#  graduation_date          :date
#  final_grade              :integer
#  ranking                  :integer
#  ranking_total            :integer
#  gender                   :string(255)
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

require 'test_helper'

class GraduateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
