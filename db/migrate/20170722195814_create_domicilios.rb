class CreateDomicilios < ActiveRecord::Migration[5.0]
  def change
    create_table :domicilios do |t|
      t.string :cp
      t.string :localidad
      t.string :domicilio
      t.string :telefono
      t.string :tipo
      t.string :notas
      t.integer :profesional_id

      t.timestamps
    end
  end
end
