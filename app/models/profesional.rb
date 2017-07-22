class Profesional < ActiveRecord::Base
  attr_accessible :apellido, :nombres, :tipo_doc, :nro_doc, :fecha_nacimiento
  has_one :matricula
  has_many :domicilio
end
