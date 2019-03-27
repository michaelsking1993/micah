# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Project.count > 0
  sample_user = User.create(first_name: 'sample', last_name: 'user', password_digest: 'sample_password', email: 'sample_email@sample.com')
  sample_projects = user.projects.create([{title: 'CocoMío MVP'}, {title: 'Micah'}])
end
