class AddDataFimAndVisibilidadeListas < ActiveRecord::Migration
  def change
    add_column :listas, :dt_fechamento, :datetime
    add_column :listas, :publicada, :boolean
  end
end
