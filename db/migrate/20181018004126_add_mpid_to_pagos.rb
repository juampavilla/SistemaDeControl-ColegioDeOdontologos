class AddMpidToPagos < ActiveRecord::Migration[5.1]
  def change
    add_column :pagos, :mp_id, :integer
  end
end
