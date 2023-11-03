class Song < ApplicationRecord
  has_one :composition_item, as: :composable, dependent: :destroy, inverse_of: :composable
  belongs_to :album, optional: true
end
