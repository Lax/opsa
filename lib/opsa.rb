#!/usr/bin/env ruby

class OPSA
  attr_accessor :lang

  def initialize(params)
    if lang = params[:language]
      @lang = lang
    end
  end

  def r(words)
    @lang.input(words)
  end
end

require 'opsa/language'