#!/usr/bin/env ruby

class OPSA::Language
  def initialize
    @actions = Hash.new nil
  end

  # Define language
  #
  # Example:
  #   lang.respond_to Regexp.new('^say_hello (.+)') do |match|
  #      puts "> Hello, #{match}!"
  #   end
  #
  # Arguments:
  #   regex: Regexp
  #   action: Block

  def respond_to(regex, &action)
    @actions[regex] ||= action
  end

  def input(text)
    @actions.each do |regex, action|
      if _match = text.match(regex)
        args = _match.captures
        if args.size > 0
          action.call(*args)
        else
          action.call(text)
        end
      else
        next
      end
    end
  end
end

if __FILE__ == $0
  lang = OPSA::Language.new

  lang.respond_to Regexp.new('^say_hello (.+)') do |match|
    puts "Hello, #{match}!"
  end
  lang.respond_to Regexp.new('^echo:(.+)') do |match|
    puts match
  end

  counter = 0
  lang.respond_to Regexp.new('^incr$') do |text|
    counter += 1
  end

  lang.input("say_hello world")
  lang.input("say_hello beautifull sunshine")
  lang.input("echo:hello")
  lang.input("echo:world")

  lang.input("incr")
  puts counter
end