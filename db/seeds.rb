# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [{email: 'yehuda@conduit.com', pass: '1234'}, {email: 'moshe.tini@conduit.com', pass: '1234'}, {email: 'avi.kedar@conduit.com', pass: '1234'}]

users.each { | user | User.create(email: user[:email], password: user[:pass], password_confirmation: user[:pass], remember_me: false)}
