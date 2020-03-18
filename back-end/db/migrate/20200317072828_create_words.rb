class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :name
      t.string :engName
      t.string :shortEng
      t.string :entity
      t.string :column
      t.string :javascript
      t.string :wordClass
      t.string :wordClassMember
      t.string :paramValue

      t.timestamps
    end
  end
end
