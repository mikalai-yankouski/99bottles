# frozen_string_literal: true

require './lib/services/string_generator.rb'

class SongIterator
  attr_reader :params

  def initialize(*params)
    @params = params.flatten
  end

  def call
    song = []
    params.each do |number|
      song.push(StringGenerator.new(number).call)
    end
    song.join("\n")
  end
end
