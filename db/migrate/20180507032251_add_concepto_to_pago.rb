class AddConceptoToPago < ActiveRecord::Migration[5.1]
  def change
    add_column :pagos, :concepto, :string
  end
end
