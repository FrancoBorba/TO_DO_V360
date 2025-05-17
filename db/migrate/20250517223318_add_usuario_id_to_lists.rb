class AddUsuarioIdToLists < ActiveRecord::Migration[7.1]
  def change
    add_reference :lists, :usuario, null: false, foreign_key: true
  end
end
