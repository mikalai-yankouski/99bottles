# frozen_string_literal: true

class StringGenerator
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def call
    string
  end

  private

  def string
    "#{number} bottles of beer on the wall, #{number} bottles of beer.\n\
    Take one down and pass it around, #{number - 1} bottles of beer on the wall."
  end
end
