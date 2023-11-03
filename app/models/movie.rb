class Movie < ApplicationRecord
  has_one :composition_item, as: :composable, dependent: :destroy
end
