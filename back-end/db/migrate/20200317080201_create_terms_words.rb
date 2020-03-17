class CreateTermsWords < ActiveRecord::Migration[5.2]
  def change
    create_table :terms_words do |t|
      t.integer :termsId
      t.integer :wordId
      t.integer :seq

      t.timestamps
    end
  end
end
