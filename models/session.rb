class Session

  attr_reader :id, :workshop_id
  attr_accessor :time, :date, :capacity

  def initialize(options)
    @id = options['id'].to_i if ['id']
    @workshop_id = options['workshop_id'].to_i
    @start_time = options['start_time']
    @date = options['date']
    @capacity = options['capacity'].to_i
  end


end
