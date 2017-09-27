class CreateQuizzs < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzs do |t|
      t.string :name, null: false, unique: true
      t.references :subcategory, foreign_key: true

      t.timestamps
    end
  end
end
