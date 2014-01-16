require 'test/unit'
require 'opsa'

class OPSATest < Test::Unit::TestCase
  def test_incr_one
    lang = OPSA::Language.new

    counter = 0
    lang.respond_to Regexp.new('^incr$') do |text|
      counter += 1
    end
    robot = OPSA.new(:language => lang)

    robot.r("incr")
    robot.r("inc")
    robot.r("incr1")

    assert_equal 1, counter
  end

  def test_echo_words
    lang = OPSA::Language.new

    lang.respond_to Regexp.new('^echo:(.+)') do |match|
      match
    end
    robot = OPSA.new(:language => lang)

    assert_equal "hello", robot.r("echo:hello")
  end
end