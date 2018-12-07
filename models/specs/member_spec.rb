require('minitest/autorun')
require('minitest/rg')
require_relative('../member.rb')

class TestMember < MiniTest::Test

  def setup()
    options = {
      'first_name' => 'Sarah',
      'last_name' => 'Smith',
      'age' => 24
    }
    @member1 = Member.new(options)
  end

  def test_member_has_first_name()
    assert_equal('Sarah', @member1.first_name)
  end

  def test_member_has_last_name()
    assert_equal('Smith', @member1.last_name)
  end

  def test_member_has_age()
    assert_equal(24, @member1.age)
  end
end
