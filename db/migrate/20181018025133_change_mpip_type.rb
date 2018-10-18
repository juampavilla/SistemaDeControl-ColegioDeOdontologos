class ChangeMpipType < ActiveRecord::Migration[5.1]
  def up
    change_column :pagos, :mp_id, :bigint
  end

  def down
    change_column :pagos, :mp_id, :integer
  end
end
