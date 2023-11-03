class Album < ApplicationRecord
  has_one :composition_item, as: :composable, dependent: :destroy
  has_many :songs, dependent: :destroy
end
