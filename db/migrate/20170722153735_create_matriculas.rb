class CreateMatriculas < ActiveRecord::Migration
  def change
    create_table :matriculas do |t|
      t.string :estado
      t.string :matricula
      t.date :fecha_inscripcion
      t.string :libro
      t.integer :folio
      t.date :fecha_habilitacion
      t.string :nota_fecha_habilitacion
      t.integer :vencimiento
      t.string :especialidad
      t.date :fecha_vencimiento
      t.integer :profesional_id
      t.string :notas

      t.timestamps
    end
  end
end
