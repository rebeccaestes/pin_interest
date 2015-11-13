# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

pins = Pin.create(
	[{ title: 'General Assembly'},
	{ img_url: 'https://generalassemb.ly/online/assets/ga-lockup-logo-9d95d5d0a1c966540edaedcb440b1963.png'}
	])