class CreatePresentes < ActiveRecord::Migration[5.2]
  def change
    create_table :presentes do |t|
      t.string :nome
      t.decimal :valor, precision: 17, scale: 2
      t.string :foto
      t.text :url
      t.references :lista, index: true

      t.timestamps
    end
  end
end
