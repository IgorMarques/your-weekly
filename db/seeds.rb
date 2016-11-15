# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

VERB = %w(Learning Optmizing A\ better\ approach\ to Scaling)
TECHNOLOGIES = %w(angularjs mongodb ruby postgres)
OBJECTS = %w(objects queries ram\ usage processing)

def rand_date(days)
  n = rand(-days..days)
  Date.today.advance(days: n)
end

def random_sent_on
  [true, true, false].sample ? rand_date(100) : nil
end

LOREM = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
URL = "http://google.com";

1.upto(100) do |i|
  Post.create!(title: [VERB.sample, TECHNOLOGIES.sample, OBJECTS.sample].join(" "), description: LOREM, url: URL, sent_on: random_sent_on)
end
