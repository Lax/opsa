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

    words = nil
    lang.respond_to Regexp.new('^echo:(.+)') do |match|
      words = match
    end
    robot = OPSA.new(:language => lang)

    robot.r("echo:hello")

    assert_equal "hello", words
  end
end