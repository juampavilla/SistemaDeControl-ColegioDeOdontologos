class ChangeNotasFieldToText < ActiveRecord::Migration[5.1]
  def change
    change_column :matriculas, :notas, :text
    change_column :domicilios, :notas, :text
  end
end
