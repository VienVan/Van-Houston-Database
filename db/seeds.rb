# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'ffaker'

10.times do
     Student.create(
        email: FFaker::Internet.email,
        first_name: FFaker::Name.first_name,
        last_name: FFaker::Name.last_name,
        parent_first_name: FFaker::Name.first_name,
        parent_last_name: FFaker::Name.last_name,
        current_school: FFaker::Name.name,

      )
end

teacher = User.create([{username: 'teacher', password: '1234', email: 'teacher@teacher.com'}])
