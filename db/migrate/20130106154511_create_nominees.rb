class CreateNominees < ActiveRecord::Migration
  def change
    create_table :nominees do |t|

      t.timestamps
    end
  end
end
