class User < ApplicationRecord
  # Direct associations

  has_many   :messages,
             foreign_key: "sender_id",
             dependent: :destroy

  has_many   :items,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    username
  end
end
