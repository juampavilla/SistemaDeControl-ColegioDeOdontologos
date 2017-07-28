class Profesional < ApplicationRecord
  has_one :matricula
  has_many :domicilio
end
