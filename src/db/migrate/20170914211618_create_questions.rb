class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :body, null: false, unique: true
      t.references :quizz, foreign_key: true
      t.string :answer, null: false
      t.string :option2, null: false
      t.string :option3, null: false
      t.string :option1, null: false
      t.string :option4, null: false
      t.boolean :qtype, null: false, default: false
      t.string :ftype, default: 'text', null: false
      t.string :asset, default: ''

      t.timestamps
    end
  end
end
