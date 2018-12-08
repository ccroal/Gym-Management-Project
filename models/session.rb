require_relative('../db/sql_runner.rb')
require_relative('./workshop.rb')

class Session

  attr_reader :id
  attr_accessor :workshop_id, :time, :start_date, :capacity

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

  def workshop()
    sql = "SELECT * FROM workshops
    WHERE id = $1"
    values = [@workshop_id]
    results = SqlRunner.run(sql, values)
    workshop_hash = results[0]
    workshop = Workshop.new(workshop_hash)
    return workshop
  end
end
