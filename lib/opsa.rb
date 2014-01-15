#!/usr/bin/env ruby

class OPSA
  attr_accessor :lang

  # Initialize OPSA object
  #
  # Example:
  #   >> OPSA.new(:lang => OPSA::Language.new)
  #
  # Arguments:
  #   params: (Hash)
  #     :language: OPSA::Language

  def initialize(params)
    if lang = params[:language]
      @lang = lang
    end
  end

  # Read words and process with OPSA::Language
  #
  # Example:
  #   >> robot = OPSA.new(:language => OPSA::Language.new)
  #   >> robot.r("echo:hello")
  #
  # Arguments:
  #   words: (String)

  def r(words)
    @lang.input(words)
  end
end

require 'opsa/language'