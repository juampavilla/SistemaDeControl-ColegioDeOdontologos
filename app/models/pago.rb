class Pago < ApplicationRecord
  belongs_to :profesional
  validates_inclusion_of :concepto, in: Choices['concepto']
end
