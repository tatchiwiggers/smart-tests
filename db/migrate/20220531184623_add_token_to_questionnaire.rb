class AddTokenToQuestionnaire < ActiveRecord::Migration[6.1]
  def change
    add_column :questionnaires, :token, :string
  end
end
