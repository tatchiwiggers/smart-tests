class CreateStudentGrades < ActiveRecord::Migration[6.1]
  def change
    create_table :student_grades do |t|
      t.references :user, null: false, foreign_key: true
      t.references :questionnaire, null: false, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
