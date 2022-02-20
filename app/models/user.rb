class User < ApplicationRecord
  # Direct associations

  has_many   :items,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    username
  end

end
