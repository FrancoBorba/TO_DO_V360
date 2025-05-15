class Item < ApplicationRecord
  belongs_to :list # Feito pelo scaffold indica que um Item pertence a uma lista list:references
  validates :nome, presence: true # So permite adicionar se tiver caracter
end
