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

class Graduate < ActiveRecord::Base
  attr_accessible :curriculum, 
                  :curriculum_code, 
                  :final_grade, 
                  :gender,
                  :gender_code,
                  :graduation_ceremony_date, 
                  :graduation_date, 
                  :id_number, 
                  :ranking, 
                  :ranking_total
end
