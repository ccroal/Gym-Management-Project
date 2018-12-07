class Member

  attr_reader :id
  attr_accessor :first_name, :last_name, :age, :email

  def initialize(options)
    @id = options['id'].to_i if ['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age'].to_i
    @email = options['email']
  end

end
