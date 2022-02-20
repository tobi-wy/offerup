class ItemResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :title, :string
  attribute :description, :string
  attribute :user_id, :integer
  attribute :photo, :string
  attribute :location, :string
  attribute :category_id, :integer
  attribute :price, :integer
  attribute :status, :boolean

  # Direct associations

  has_many   :messages

  belongs_to :user

  # Indirect associations

end
