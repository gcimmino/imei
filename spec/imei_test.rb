require 'test_helper'

class ImeiTest < Test::Unit::TestCase
  def test_blank_values
    assert_invalid ''
    assert_invalid false
    assert_invalid nil
    assert_invalid '1'
    assert_invalid '123456789123456789'
  end

  def test_unmasked
    assert_valid '79927398710'
    assert_valid '79927398711'
    assert_valid '79927398712'
    assert_valid '79927398713'
    assert_valid '79927398714'
    assert_valid '79927398715'
    assert_valid '79927398716'
    assert_valid '79927398717'
    assert_valid '79927398718'
    assert_valid '79927398719'
  end

  protected

  def assert_valid(imei)
    assert mobile(:imei => imei).valid?
  end

  def assert_invalid(imei)
    assert mobile(:imei => imei).invalid?
  end

  def person(attributes = {})
    Mobile.new(attributes)
  end
end
