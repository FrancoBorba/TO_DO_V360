class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :nome
      t.boolean :concluido, default: false
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
