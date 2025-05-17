class Usuario < ApplicationRecord
  has_secure_password
  #Um usuario possui uma ou mais listas e se for deletado deleta as listas
  has_many :lists, dependent: :destroy
  
  validates :nome, presence: true
  validates :email, presence: true, uniqueness: true
end
