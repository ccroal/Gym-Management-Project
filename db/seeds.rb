require_relative('../models/workshop.rb')
require_relative('../models/session.rb')
require_relative('../models/booking.rb')
require_relative('../models/member.rb')
require('pry')

Booking.delete_all
Session.delete_all
Workshop.delete_all
Member.delete_all


workshop1 = Workshop.new({
  'type' => 'spin',
  'instructor' => 'Mark Twain'
})

workshop1.save

workshop2 = Workshop.new({
  'type' => 'body combat',
  'instructor' => 'Jane Austen'
})

workshop2.save

workshop3 = Workshop.new({
  'type' => 'zumba',
  'instructor' => 'Anne Rice'
})

workshop3.save

session1 = Session.new({
  'workshop_id' => workshop1.id,
  'start_time' => '15:00',
  'start_date' => '21st Dec',
  'capacity' => 15
})

session1.save

session2 = Session.new({
  'workshop_id' => workshop1.id,
  'start_time' => '10:00',
  'start_date' => '22nd Dec',
  'capacity' => 10
})

session2.save

session3 = Session.new({
  'workshop_id' => workshop2.id,
  'start_time' => '13:00',
  'start_date' => '22nd Dec',
  'capacity' => 20
})

session3.save

session4 = Session.new({
  'workshop_id' => workshop2.id,
  'start_time' => '20:00',
  'start_date' => '23rd Dec',
  'capacity' => 20
})

session4.save


session5 = Session.new({
  'workshop_id' => workshop3.id,
  'start_time' => '09:00',
  'start_date' => '23rd Dec',
  'capacity' => 30
})

session5.save

session6 = Session.new({
  'workshop_id' => workshop3.id,
  'start_time' => '15:00',
  'start_date' => '23rd Dec',
  'capacity' => 20
})

session6.save

member1 = Member.new({
  'first_name' => 'Olivia',
  'last_name' => 'Pope',
  'age' => 34,
  'email' => 'olivia@email.com'
})

member1.save

member2 = Member.new({
  'first_name' => 'Hank',
  'last_name' => 'Hill',
  'age' => 52,
  'email' => 'hank@email.com'
})

member2.save

member3 = Member.new({
  'first_name' => 'John',
  'last_name' => 'Tavner',
  'age' => 34,
  'email' => 'john@email.com'
})

member3.save

member4 = Member.new({
  'first_name' => 'Chloe',
  'last_name' => 'Decker',
  'age' => 32,
  'email' => 'chloe@email.com'
})

member4.save

booking1 = Booking.new({
  'session_id' => session1.id,
  'member_id' => member2.id
})

booking1.save

booking2 = Booking.new({
  'session_id' => session3.id,
  'member_id' => member2.id
})

booking2.save

booking3 = Booking.new({
  'session_id' => session1.id,
  'member_id' => member4.id
})

booking3.save

booking4 = Booking.new({
  'session_id' => session3.id,
  'member_id' => member1.id
})

booking4.save

booking5 = Booking.new({
  'session_id' => session6.id,
  'member_id' => member3.id
})

booking5.save


binding.pry
nil
