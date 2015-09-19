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

Freeboard.create(fb_title: '강의실 이용 시 주의사항', fb_content: '강의실 사용약관입니다.
           <br>1. 강의실에서는 간단한 다과 이외의 주류, 외부 음식물은 반입할 수 없습니다. 
           <br>2. 쓰레기는 강의실에서 나가실 때 가지고 나가셔야 합니다.
           <br>3. 사용하신 PC는 반드시 끄셔야 합니다. 
           <br>4. 강의실에 아무도 없을 경우 강의실 불은 반드시 꺼주시기 바랍니다.
           <br>5. PC가 있는 강의실에는 게임이나 온갖 툴바, 다운로더를 설치하실 수 없습니다.
           <br>6. 기물파손이나 낙서 등의 피해가 확인되었을 경우에는 불이익이 적용됩니다.
           <br>7. 소음, 음주, 사행성 등 불건전한 행위 적발시 즉시 퇴실 조치 합니다.
           <br>8. 퇴실 시 두고가는 물건 없는지 확인하시기 바랍니다. 분실물에 대해서는 책임지지 않으며, 분실물 발견 후 1주일내에 연락이 없으시면 폐기 처리합니다.')