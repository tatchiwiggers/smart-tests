class Answer < ApplicationRecord
  belongs_to :question

  # validates :correct, uniqueness: true
end
