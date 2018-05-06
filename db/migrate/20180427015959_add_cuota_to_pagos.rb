class AddCuotaToPagos < ActiveRecord::Migration[5.1]
  def change
    add_column :pagos, :cuota_anio, :integer
  end
end
