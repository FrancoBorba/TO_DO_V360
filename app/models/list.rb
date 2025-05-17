class List < ApplicationRecord
  belongs_to :usuario 
  #Uma List possui 1 ou mais itens , se a lista for destruida os itens tambem sao
  has_many :items, dependent: :destroy 
end
