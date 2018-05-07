# config/initializers/load_choices.rb

Choices = YAML.load_file("#{Rails.root}/config/choices.yml")
