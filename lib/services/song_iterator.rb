# frozen_string_literal: true

require './lib/services/string_generator.rb'

class SongIterator
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def call
    params.each do |number|
      return StringGenerator.new(number).call
    end
  end
end
