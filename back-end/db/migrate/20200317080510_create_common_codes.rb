class CreateCommonCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :common_codes do |t|
      t.integer :codeTypeId
      t.string :name
      t.string :engName
      t.integer :parentId

      t.timestamps
    end
  end
end
