require('minitest/autorun')
require('minitest/rg')
require_relative('../session.rb')

class TestSession < MiniTest::Test

  def setup()
    options = {
      'workshop_id' => '1',
      'start_time' => '15:00',
      'start_date' => '21st Dec',
      'capacity' => 3
    }

    @session1 = Session.new(options)
  end

  def test_session_has_start_time()
    assert_equal('15:00', @session1.start_time)
  end

  def test_session_has_date()
    assert_equal('21st Dec', @session1.start_date)
  end

  def test_session_has_a_capacity()
    assert_equal(3, @session1.capacity)
  end

  def test_session_has_workshop_id()
    assert_equal(1, @session1.workshop_id)
  end

  def test_members_booked()
    assert_equal(0, @session1.members_booked)
  end

  def test_increase_booking()
    @session1.increase_booking
    assert_equal(1, @session1.members_booked)
  end

  def test_decrease_booking()
    @session1.increase_booking
    @session1.increase_booking
    @session1.decrease_booking
    assert_equal(1, @session1.members_booked)
  end

  def test_make_booking_space_availaable()
    @session1.make_booking
    assert_equal(1, @session1.members_booked)
  end

  def test_make_booking_space_full()
    @session1.make_booking
    @session1.make_booking
    @session1.make_booking
    @session1.make_booking
    assert_equal(3, @session1.members_booked)
    assert_equal(false, @session1.make_booking)
  end
end
