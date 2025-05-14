class Item < ApplicationRecord
  belongs_to :list # Feito pelo scaffold indica que um Item pertence a uma lista list:references
end
