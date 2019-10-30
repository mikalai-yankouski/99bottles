# frozen_string_literal: true

require './lib/services/param_parser.rb'
require './lib/services/song_iterator.rb'

class Bottles
  def verse(*params)
    params = ParamParser.new(params).call
    SongIterator.new(params).call
  end

  def song
  end
end
