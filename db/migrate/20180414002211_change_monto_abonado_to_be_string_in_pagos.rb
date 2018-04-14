class ChangeMontoAbonadoToBeStringInPagos < ActiveRecord::Migration[5.1]
  def up
    change_column :pagos, :monto_abonado, :string
  end

  def down
    change_column :pagos, :monto_abonado, :currency
  end
end
