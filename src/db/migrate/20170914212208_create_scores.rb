class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.references :quizz, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
