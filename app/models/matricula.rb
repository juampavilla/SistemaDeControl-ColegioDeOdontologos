class Matricula < ApplicationRecord
  belongs_to :profesional
  validates_inclusion_of :estado, in: Choices['estado']
end
