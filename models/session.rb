require_relative('../db/sql_runner.rb')
require_relative('./workshop.rb')
require_relative('./member.rb')

class Session

  attr_reader :id
  attr_accessor :workshop_id, :start_time, :start_date, :capacity

  def initialize(options)
    @id = options['id'].to_i if ['id']
    @workshop_id = options['workshop_id'].to_i()
    @start_time = options['start_time']
    @start_date = options['start_date']
    @capacity = options['capacity'].to_i
  end

  def save()
    sql = "INSERT INTO sessions (workshop_id, start_time, start_date, capacity)
    VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@workshop_id, @start_time, @start_date, @capacity]
    session = SqlRunner.run(sql, values).first
    @id = session['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM sessions"
    sessions = SqlRunner.run(sql)
    result = sessions.map {|session| Session.new(session)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM sessions"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM sessions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE sessions SET (workshop_id, start_time, start_date, capacity) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@workshop_id, @start_time, @start_date, @capacity, @id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM sessions WHERE id = $1"
    values = [id]
    session =  SqlRunner.run(sql, values).first
    return Session.new(session)
  end

  def workshop()
    sql = "SELECT * FROM workshops
    WHERE id = $1"
    values = [@workshop_id]
    results = SqlRunner.run(sql, values)
    workshop_hash = results[0]
    workshop = Workshop.new(workshop_hash)
    return workshop
  end

  def members()
    sql = "SELECT members.* FROM members INNER JOIN bookings ON members.id = bookings.member_id WHERE bookings.session_id = $1"
    values = [@id]
    members_array = SqlRunner.run(sql, values)
    results =  members_array.map{ |member| Member.new(member)}
    return results
  end

  def bookings()
    sql = "SELECT * from bookings WHERE session_id = $1"
    values = [@id]
    booking_array = SqlRunner.run(sql, values)
    results = booking_array.map{|booking| Booking.new(booking)}
    return results
  end

  #Don't need theses methods in current iteration

  # def increase_booking()
  #   @members_booked += 1
  # end
  #
  # def decrease_booking()
  #   @members_booked -= 1
  # end
  #
  # def make_booking()
  #   if @capacity > @members_booked
  #    increase_booking()
  #   else
  #    return false
  #  end
  # end

end
