require('minitest/autorun')
require('minitest/rg')
require_relative('../workshop.rb')


class TestWorkshop < Minitest::Test

  def setup()
    options = {
      'type' => 'Spin',
      'instructor' => 'David MaCleod'
    }
    @workshop1 = Workshop.new(options)
  end

  def test_workshop_has_type()
   assert_equal("Spin", @workshop1.type)
  end

  def test_workshop_has_instructor()
    assert_equal("David MaCleod", @workshop1.instructor)
  end

end
