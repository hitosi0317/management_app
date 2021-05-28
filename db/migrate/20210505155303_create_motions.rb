class CreateMotions < ActiveRecord::Migration[6.0]
  def change
    create_table :motions do |t|
      t.float    :weight,   null: false
      t.string   :plans1,   null: false
      t.string   :plans2 
      t.string   :plans3
      t.string   :plans4
      t.string   :plans5
      t.time      :count1,  null: false
      t.time      :count2
      t.time      :count3
      t.time      :count4
      t.time      :count5
      t.text  :memo     
      t.references :user,  foreign_key: true
     
      t.timestamps
    end
  end
end
