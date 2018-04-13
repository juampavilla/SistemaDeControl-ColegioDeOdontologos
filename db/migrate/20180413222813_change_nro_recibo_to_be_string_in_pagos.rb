class ChangeNroReciboToBeStringInPagos < ActiveRecord::Migration[5.1]
  def down
    change_column :pagos, :nro_recibo, :integer
  end

  def up
    change_column :pagos, :nro_recibo, :string
  end
end
