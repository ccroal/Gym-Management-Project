require_relative('../db/sql_runner.rb')
require_relative('./member.rb')
require_relative('./session.rb')

class Booking

  def initialize(options)
    @member_id = options['member_id'].to_i()
    @session_id = options['session_id'].to_i()
  end

  def save()
    sql = "INSERT INTO bookings (member_id, session_id)
    VALUES ($1, $2) RETURNING id"
    values = [@member_id, @session_id]
    booking = SqlRunner.run(sql, values).first
    @id = booking['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM bookings"
    bookings = SqlRunner.run(sql)
    result = bookings.map {|booking| Booking.new(booking)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM bookings"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM bookings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM bookings WHERE id = $1"
    values = [id]
    bookings =  SqlRunner.run(sql, values).first
    return Booking.new(bookings)
  end

  def member()
    sql = "SELECT * FROM members WHERE id = $1"
    values = [@member_id]
    member_hash = SqlRunner.run(sql, values).first
    member = Member.new(member_hash)
    return member
  end

  def session()
    sql = "SELECT * FROM sessions WHERE id = $1"
    values = [@session_id]
    session_hash = SqlRunner.run(sql, values).first
    session = Session.new(session_hash)
    return session
  end
end
