# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end
ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular 'profesional', 'profesionales'
end

# para probar en consola include ActionView::Helpers::TextHelper
ActiveSupport::Inflector.inflections(:es) do |inflect|
  inflect.singular /^(.+[bcdfghjklmnpqrstvwxyz]i)s$/i, '\1'
  inflect.plural /^(.+[bcdfghjklmnpqrstvwxyz]i)$/i, '\1s'
  inflect.singular /^(.+[bdfghjklmnpqrtvwxyz][bcdfghjklmnpqrtvwxyz])s$/i, '\1'
  inflect.plural /^(.+[bdfghjklmnpqrtvwxyz][bcdfghjklmnpqrtvwxyz])$/i, '\1s'
  inflect.singular /^(.+[aeéiou])s$/i, '\1'
  inflect.plural /^(.+[aeéiou])$/i, '\1s'
  inflect.singular /^(.+[íú])es$/i, '\1'
  inflect.plural /^(.+[íú])$/i, '\1es'

  inflect.singular /^(.+[áó])s$/i, '\1'
  inflect.plural /^(.+[áó])$/i, '\1s'

  inflect.singular /^(.+[xs])es$/i, '\1'
  inflect.plural /^(.+[xs])$/i, '\1es'

  inflect.singular /^(.+[^c][bcfghkmpqtvwy])s$/i, '\1'
  inflect.plural /^(.+[^c][bcfghkmpqtvwy])$/i, '\1s'

  inflect.singular /^(.+[aáeéiíoóuú]y)es$/i, '\1'
  inflect.plural /^(.+[aáeéiíoóuú]y)$/i, '\1es'

  inflect.singular /^(.+ch)es$/i, '\1'
  inflect.plural /^(.+ch)$/i, '\1es'

  inflect.singular /^(.+[aáeéiíoóuú])ces$/i, '\1z'
  inflect.plural /^(.+[aáeéiíoóuú])z$/i, '\1ces'
  inflect.singular /^(.+[aáeéiíoóuú][lrndj])es$/i, '\1'
  inflect.plural /^(.+[aáeéiíoóuú][lrndj])$/i, '\1es'
end
