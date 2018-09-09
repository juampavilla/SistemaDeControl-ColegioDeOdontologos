module ProfesionalHelper
  def getEmail(profesional)
    matricula = profesional.matricula.matricula
    nombres = profesional.nombres.downcase.strip.delete(' ')
    apellido = profesional.apellido.downcase.strip.delete(' ')
    email = "#{matricula}#{nombres}@#{apellido}.com"
  end
end
