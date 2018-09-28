class AddStatusToPagos < ActiveRecord::Migration[5.1]
  def change
    add_column :pagos, :status, :string
  end
end
