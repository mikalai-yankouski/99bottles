# frozen_string_literal: true

require './lib/services/string_generator.rb'

class SongIterator
  attr_reader :params

  def initialize(*params)
    @params = params.flatten
  end

  def call
    song_strings = params.each_with_object([]) do |number, memo|
      memo.push(StringGenerator.new(number).call)
    end

    song_strings.join("\n")
  end
end
