# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Building.create([{ name: '대학원동' }, { name: '90주년 기념관' }, { name: '인문사회관' }, { name: '예술관' }, { name: '100주년 기념탑' }, { name: '피어선홀' }, { name: '학생관' }, { name: '운동장' }, { name: '이공관' }, { name: '제 2 피어선 빌딩' }, { name: '제3국제관' }])

Room.create(building_name: '대학원동', room_number: 102)
Room.create(building_name: '대학원동', room_number: 103)
Room.create(building_name: '대학원동', room_number: 104)


Room.create(building_name: '이공관', room_number: 201)
Room.create(building_name: '이공관', room_number: 202)
Room.create(building_name: '이공관', room_number: 203)
Room.create(building_name: '이공관', room_number: 204)


Room.create(building_name: '이공관', room_number: 501)
Room.create(building_name: '이공관', room_number: 502)
Room.create(building_name: '이공관', room_number: 503)
Room.create(building_name: '이공관', room_number: 504)

