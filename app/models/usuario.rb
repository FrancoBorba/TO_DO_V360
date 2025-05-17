class Usuario < ApplicationRecord
  has_secure_password # Quando adicionado uma senha ela sera automaticamente 
                      # convertida em hash
  #Um usuario possui uma ou mais listas e se for deletado deleta as listas
  has_many :lists, dependent: :destroy
  
 
  validates :nome, presence: { message: "não pode ficar em branco" }
  validates :email, presence: { message: "não pode ficar em branco" }
  validates :password, presence: { message: "não pode ficar em branco" }
end
