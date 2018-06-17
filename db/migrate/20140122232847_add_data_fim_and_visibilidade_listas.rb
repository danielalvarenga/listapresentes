class AddDataFimAndVisibilidadeListas < ActiveRecord::Migration[5.2]
  def change
    add_column :listas, :dt_fechamento, :datetime
    add_column :listas, :publicada, :boolean
  end
end
