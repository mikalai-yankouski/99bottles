# frozen_string_literal: true

require './lib/services/song_iterator.rb'

class Bottles
  FULL_SONG_INDEXEX = Array.new(100) { |i| i }.reverse

  def verse(params)
    SongIterator.new(params).call
  end

  def verses(*params)
    SongIterator.new(params_to_array(params)).call
  end

  def song
    SongIterator.new(FULL_SONG_INDEXEX).call
  end

  private

  def params_to_array(params)
    params.reverse!
    (params.first..params.last).to_a.reverse
  end
end
