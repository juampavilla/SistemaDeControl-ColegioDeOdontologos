##asignar un email/usuario a todos los profesionales##
Profesional.find_each do |profesional|
  id = profesional.id
  matricula = profesional.matricula.matricula
  nombres = profesional.nombres.downcase.strip.delete(' ')
  apellido = profesional.apellido.downcase.strip.delete(' ')
  email = "#{matricula}#{nombres}@#{apellido}.com"
  user = User.new
  user.email = email
  user.password = matricula
  user.password_confirmation = matricula
  user.profesional_id = id
  puts user.email
end
