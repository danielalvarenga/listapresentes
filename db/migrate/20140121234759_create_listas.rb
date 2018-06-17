class CreateListas < ActiveRecord::Migration[5.2]
  def change
    create_table :listas do |t|
      t.string :nome
      t.string :presenteados
      t.text :descricao
      t.string :foto
      t.references :user, index: true

      t.timestamps
    end
  end
end
