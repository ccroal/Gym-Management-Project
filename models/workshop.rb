require_relative("../db/sql_runner.rb")

class Workshop

  attr_reader :id, :type
  attr_accessor :instructor

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
    @instructor = options['instructor']
  end


  def save()
    sql = "INSERT INTO workshops (type, instructor)
    VALUES ($1, $2) RETURNING id"
    values = [@type, @instructor]
    workshop = SqlRunner.run(sql, values).first
    @id = workshop['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM workshops"
    workshops = SqlRunner.run(sql)
    result = workshops.map {|workshop| Workshop.new(workshop)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM workshops"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM workshops WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE workshops SET (type, instructor) = ($1, $2) WHERE id = $3"
    values = [@type, @instructor, @id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE workshops SET (type, instructor) = ($1, $2) WHERE id = $3"
    values = [@type, @instructor, @id]
    SqlRunner.run(sql, values)
  end

  def sessions()
    sql = "SELECT * FROM sessions
    WHERE workshop_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    sessions = results.map{ |session| Session.new(session) }
    return sessions
  end

  def members()
    sql = "SELECT members.* FROM members INNER JOIN bookings ON members.id = bookings.member_id INNER JOIN sessions ON bookings.session_id = sessions.id WHERE sessions.workshop_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    members = results.map{ |member| Member.new(member)}
    return members
  end

end
