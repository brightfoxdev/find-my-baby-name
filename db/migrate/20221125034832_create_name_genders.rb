class CreateNameGenders < ActiveRecord::Migration[7.0]
  def change
    create_table :name_genders do |t|
      t.belongs_to :name, null: false, foreign_key: true
      t.belongs_to :gender, null: false, foreign_key: true

      t.timestamps
    end
  end
end
