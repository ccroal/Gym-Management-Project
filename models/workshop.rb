class Workshop

  attr_reader :id, :type
  attr_accessor :instructor

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
    @instructor = options['instructor']
  end


end
