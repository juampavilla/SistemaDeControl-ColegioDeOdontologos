class Domicilio < ActiveRecord::Base
  attr_accessible :cp, :domicilio, :localidad, :notas, :profesional_id, :telefono, :tipo
  belongs_to :profesional
end
