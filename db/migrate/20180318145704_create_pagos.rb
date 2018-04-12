class CreatePagos < ActiveRecord::Migration[5.1]
  def change
    create_table :pagos do |t|
      t.money :monto_abonado
      t.date :fecha_pago
      t.integer :nro_recibo
      t.integer :profesional_id
      t.timestamps
    end
  end
end
