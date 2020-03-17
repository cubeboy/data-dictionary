class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :name
      t.string :engName
      t.string :shortEng
      t.string :entity
      t.string :column
      t.string :class
      t.string :classMember
      t.string :paramValue

      t.timestamps
    end
  end
end
