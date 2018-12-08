require_relative('../db/sql_runner.rb')

class Member

  attr_reader :id
  attr_accessor :first_name, :last_name, :age, :email

  def initialize(options)
    @id = options['id'].to_i() if ['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age'].to_i()
    @email = options['email']
  end

  def save()
    sql = "INSERT INTO members (first_name, last_name, age, email)
    VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@first_name, @last_name, @age, @email]
    member = SqlRunner.run(sql, values).first
    @id = member['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM members"
    members = SqlRunner.run(sql)
    result = members.map {|member| Member.new(member)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM members"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM members WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE members SET (first_name, last_name, age, email) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@first_name, @last_name, @age, @email, @id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM members WHERE id = $1"
    values = [id]
    member =  SqlRunner.run(sql, values).first
    return Member.new(member)
  end

  def sessions()
    sql = "SELECT sessions.* FROM sessions INNER JOIN bookings ON sessions.id = bookings.session_id WHERE bookings.member_id = $1"
    values = [@id]
    sessions_array = SqlRunner.run(sql, values)
    results =  sessions_array.map{ |sessions| Session.new(sessions)}
    return results
  end


end
