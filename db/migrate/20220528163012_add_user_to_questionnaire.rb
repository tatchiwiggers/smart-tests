class AddUserToQuestionnaire < ActiveRecord::Migration[6.1]
  def change
    add_reference :questionnaires, :user, foreign_key: true
  end
end
