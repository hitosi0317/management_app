class CreateMotions < ActiveRecord::Migration[6.0]
  def change
    create_table :motions do |t|
      t.string   :training1, null: false
      t.string   :training2 
      t.string   :training3
      t.string   :training4
      t.string   :training5
      t.integer  :count1,  null: false
      t.integer  :count2
      t.integer  :count3
      t.integer  :count4
      t.integer  :count5
      t.references :user,  foreign_key: true
      t.timestamps
    end
  end
end
