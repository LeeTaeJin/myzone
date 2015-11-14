# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Building.create(name: '대학원동', en_name: 'Graduate School Building', img:'http://www.ptu.ac.kr/ptu/include/img/contents/campus_map/mapimg_1.jpg')
Building.create(name: '인문사회관', en_name: 'Humanities & Social Science Building', img:'http://www.ptu.ac.kr/ptu/include/img/contents/campus_map/mapimg_5.jpg')
Building.create(name: '예술관', en_name: 'Fine Art Building', img:'http://www.ptu.ac.kr/ptu/include/img/contents/campus_map/mapimg_6.jpg')
Building.create(name: '100주년 기념탑', en_name: 'Centennial Tower', img:'http://www.ptu.ac.kr/ptu/include/img/contents/campus_map/mapimg_7.jpg')
Building.create(name: '피어선홀', en_name: 'Pierson Hall', img:'http://www.ptu.ac.kr/ptu/include/img/contents/campus_map/mapimg_8.jpg')
Building.create(name: '학생관', en_name: 'Student Activity Center', img:'http://www.ptu.ac.kr/ptu/include/img/contents/campus_map/mapimg_13.jpg')
Building.create(name: '이공관', en_name: 'Science & Engineering Building', img:'http://www.ptu.ac.kr/ptu/include/img/contents/campus_map/mapimg_17.jpg')
Building.create(name: '대학본관', en_name: 'Main Building', img:'http://www.ptu.ac.kr/ptu/include/img/contents/campus_map/mapimg_11.jpg')
Building.create(name: '제 3 국제관', en_name: 'International Hall III', img:'http://www.ptu.ac.kr/ptu/include/img/contents/campus_map/mapimg_20.jpg')


Room.create(building_name: '대학원동', room_number: 102, accept_people: 40)
Room.create(building_name: '대학원동', room_number: 103, accept_people: 30)
Room.create(building_name: '대학원동', room_number: 104, accept_people: 50)

Room.create(building_name: '이공관', room_number:'B 101', accept_people: 180)
Room.create(building_name: '이공관', room_number:'B 106' , accept_people: 50)
Room.create(building_name: '이공관', room_number:'B 107', accept_people: 50)
Room.create(building_name: '이공관', room_number:'B 108', accept_people: 50)
Room.create(building_name: '이공관', room_number: 108, accept_people: 70)
Room.create(building_name: '이공관', room_number: 109, accept_people: 50)
Room.create(building_name: '이공관', room_number: 110, accept_people: 70)
Room.create(building_name: '이공관', room_number: 111, accept_people: 50)
Room.create(building_name: '이공관', room_number: 201, accept_people: 50)
Room.create(building_name: '이공관', room_number: 202, accept_people: 40)
Room.create(building_name: '이공관', room_number: 203, accept_people: 50)
Room.create(building_name: '이공관', room_number: 204, accept_people: 50)
Room.create(building_name: '이공관', room_number: 205, accept_people: 90)
Room.create(building_name: '이공관', room_number: 301, accept_people: 40)
Room.create(building_name: '이공관', room_number: 302, accept_people: 50)
Room.create(building_name: '이공관', room_number: 303, accept_people: 50)
Room.create(building_name: '이공관', room_number: 304, accept_people: 50)
Room.create(building_name: '이공관', room_number: 305, accept_people: 50)
Room.create(building_name: '이공관', room_number: 401, accept_people: 50)
Room.create(building_name: '이공관', room_number: 402, accept_people: 50)
Room.create(building_name: '이공관', room_number: 403, accept_people: 50)
Room.create(building_name: '이공관', room_number: 404, accept_people: 50)
Room.create(building_name: '이공관', room_number: 405, accept_people: 50)



Room.create(building_name: '이공관', room_number: 501, accept_people: 40)
Room.create(building_name: '이공관', room_number: 502, accept_people: 40)
Room.create(building_name: '이공관', room_number: 503, accept_people: 40)
Room.create(building_name: '이공관', room_number: 504, accept_people: 40)


Room.create(building_name: '인문사회관', room_number: 102, accept_people: 30)
Room.create(building_name: '인문사회관', room_number: 103, accept_people: 30)
Room.create(building_name: '인문사회관', room_number: 104, accept_people: 30)


Room.create(building_name: '예술관', room_number: 201, accept_people: 30)
Room.create(building_name: '예술관', room_number: 202, accept_people: 30)
Room.create(building_name: '예술관', room_number: 203, accept_people: 30)
Room.create(building_name: '예술관', room_number: 204, accept_people: 30)


Room.create(building_name: '100주년 기념탑', room_number: 501, accept_people: 50)
Room.create(building_name: '100주년 기념탑', room_number: 502, accept_people: 50)
Room.create(building_name: '100주년 기념탑', room_number: 503, accept_people: 50)
Room.create(building_name: '100주년 기념탑', room_number: 504, accept_people: 50)

Room.create(building_name: '피어선홀', room_number: 201, accept_people: 80)
Room.create(building_name: '피어선홀', room_number: 202, accept_people: 80)
Room.create(building_name: '피어선홀', room_number: 203, accept_people: 80)
Room.create(building_name: '피어선홀', room_number: 204, accept_people: 80)

Room.create(building_name: '학생관', room_number: 201, accept_people: 80)
Room.create(building_name: '학생관', room_number: 202, accept_people: 80)
Room.create(building_name: '학생관', room_number: 203, accept_people: 80)
Room.create(building_name: '학생관', room_number: 204, accept_people: 80)

Room.create(building_name: '제 2 피어선 빌딩', room_number: 201, accept_people: 100)
Room.create(building_name: '제 2 피어선 빌딩', room_number: 202, accept_people: 100)
Room.create(building_name: '제 2 피어선 빌딩', room_number: 203, accept_people: 100)
Room.create(building_name: '제 2 피어선 빌딩', room_number: 204, accept_people: 100)


Room.create(building_name: '제3국제관', room_number: 201, accept_people: 30)
Room.create(building_name: '제3국제관', room_number: 202, accept_people: 30)
Room.create(building_name: '제3국제관', room_number: 203, accept_people: 30)
Room.create(building_name: '제3국제관', room_number: 204, accept_people: 30)
