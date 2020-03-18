class CreateTerms < ActiveRecord::Migration[5.2]
  def change
    create_table :terms do |t|
      t.text :description
      t.string :termType
      t.integer :termTypeSize
      t.string :mainCategoryId
      t.string :middleCategoryId
      t.string :subCategoryId

      t.timestamps
    end
  end
end
