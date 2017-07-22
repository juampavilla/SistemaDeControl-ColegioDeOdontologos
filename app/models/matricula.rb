class Matricula < ActiveRecord::Base
  attr_accessible :especialidad, :estado, :fecha_habilitacion, :fecha_inscripcion, :fecha_vencimiento, :folio, :libro, :matricula, :nota_fecha_habilitacion, :notas, :profesional_id, :vencimiento
  belongs_to :profesional
end
