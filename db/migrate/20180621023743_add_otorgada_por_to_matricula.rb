class AddOtorgadaPorToMatricula < ActiveRecord::Migration[5.1]
  def change
    add_column :matriculas, :especialidad_otorgada_por, :string
  end
end
