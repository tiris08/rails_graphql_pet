class CompositionItem < ApplicationRecord
  belongs_to :composable, polymorphic: true
end
