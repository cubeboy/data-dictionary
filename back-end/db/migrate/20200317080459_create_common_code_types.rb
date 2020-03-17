class CreateCommonCodeTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :common_code_types do |t|
      t.string :name
      t.string :engName

      t.timestamps
    end
  end
end
