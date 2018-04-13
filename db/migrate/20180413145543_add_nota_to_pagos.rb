class AddNotaToPagos < ActiveRecord::Migration[5.1]
  def change
    add_column :pagos, :notas, :text
  end
end
