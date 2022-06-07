class AddRepeatToStudentGrades < ActiveRecord::Migration[6.1]
  def change
    add_column :student_grades, :repeat, :boolean, default: false
  end
end
