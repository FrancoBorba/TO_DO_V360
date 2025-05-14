class List < ApplicationRecord
  #Uma List possui 1 ou mais itens , se a lista for destruida os itens tambem sao
  has_many :itens, dependent: :destroy 
end
