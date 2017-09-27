class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.references :user, foreign_key: true
      t.references :quizz, foreign_key: true
      t.references :question, foreign_key: true
      t.integer :score
      t.string :ans

      t.timestamps
    end
  end
end
