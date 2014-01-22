class CreateMensagens < ActiveRecord::Migration
  def change
    create_table :mensagens do |t|
      t.string :remetente
      t.text :texto
      t.boolean :aprovada
      t.references :presente, index: true

      t.timestamps
    end
  end
end
