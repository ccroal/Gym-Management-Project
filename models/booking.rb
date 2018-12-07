class Booking

  def setup(options)
    @member_id = options['member_id'].to_i
    @session_id = options['session_id'].to_i
  end

end
