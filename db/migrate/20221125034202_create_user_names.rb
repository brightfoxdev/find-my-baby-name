class CreateUserNames < ActiveRecord::Migration[7.0]
  def change
    create_table :user_names do |t|
      t.boolean :liked
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :name, null: false, foreign_key: true

      t.timestamps
    end
  end
end
