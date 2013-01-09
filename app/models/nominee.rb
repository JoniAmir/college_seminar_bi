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
#  grade              :integer
#  sat_grade          :integer
#  last_result_graphs :string(255)
#

class Nominee < ActiveRecord::Base
  # attr_accessible :title, :body
end
