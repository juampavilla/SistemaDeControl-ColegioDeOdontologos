class AddNotaToPagos < ActiveRecord::Migration[5.1]
  def change
    add_column :pagos, :nota, :string
  end
end
