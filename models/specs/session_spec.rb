require('minitest/autorun')
require('minitest/rg')
require_relative('../session.rb')

class TestSession < MiniTest::Test

  def setup()
    options = {
      'workshop_id' => '1',
      'start_time' => '15:00',
      'date' => '21st Dec',
      'capacity' => 15
    }

    @session1 = Session.new(options)
  end

  def test_session_has_start_time()
    assert_equal('15:00', @session1.time)
  end

  def test_session_has_date()
    assert_equal('21st Dec', @session1.date)
  end

  def test_session_has_a_capacity()
    assert_equal(15, @session1.capacity)
  end

  def test_session_has_workshop_id()
    assert_equal(1, @session1.workshop_id)
  end

end
