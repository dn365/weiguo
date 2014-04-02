# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


unless User.find_by_email("weiguo_admin@weiguo.me")
  user = User.new(email: "weiguo_admin@weiguo.me", password: "weiguo@hzrw", password_confirmation: "weiguo@hzrw")
  # user.skip_confirmation!
  user.save
  user.add_role :admin
end
