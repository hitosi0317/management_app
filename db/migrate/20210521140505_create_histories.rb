class CreateHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :histories do |t|
      t.references :user,  foreign_key: true
      t.references :motion, foreign_key: true
      t.timestamps
    end
  end
end
