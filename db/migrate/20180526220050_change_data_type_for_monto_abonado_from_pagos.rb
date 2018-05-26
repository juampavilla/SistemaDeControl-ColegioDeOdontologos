class ChangeDataTypeForMontoAbonadoFromPagos < ActiveRecord::Migration[5.1]
  def up
    change_column :pagos, :monto_abonado, :float, using: "monto_abonado::double precision"
  end

  def down
    change_column :pagos, :monto_abonado, :string
  end
end
