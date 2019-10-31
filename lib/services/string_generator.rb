# frozen_string_literal: true

class StringGenerator
  attr_reader :number, :values

  BOTTLES = 'bottles'
  BOTTLE = 'bottle'
  DEFAULT_PRONOUN = 'Take it'
  ANOTHER_PRONOUN = 'Go to the store'
  PRONOUN = 'Take one'
  ZERO_TITLE = 'No more'

  BOTTLES_ARR = (0...100).to_a

  def initialize(number)
    @number = number
    @values = genreate_default_values
  end

  def call
    string
  end

  private

  def genreate_default_values
    if number == 0
      {
        title: ZERO_TITLE,
        bottle: BOTTLES,
        pronoun: ANOTHER_PRONOUN,
        text: ZERO_TITLE.downcase,
        result: 'no more bottles'
      }
    elsif number == 1
      {
        title: number,
        bottle: BOTTLE,
        pronoun: DEFAULT_PRONOUN,
        text: number,
        result: ending_row
      }
    else
      {
        title: number,
        bottle: BOTTLES,
        pronoun: PRONOUN,
        text: number,
        result: ending_row
      }
    end
  end

  def ending_row
    if number == 1
      'no more bottles'
    elsif number == 2
      "#{BOTTLES_ARR[(number - 1)]} bottle"
    else
      "#{BOTTLES_ARR[(number - 1)]} bottles"
    end

  end

  def string
    p number.zero?
    "#{values[:title]} #{values[:bottle] } of beer on the wall, #{values[:text]} #{values[:bottle]  } of beer.\n" +
    "#{values[:pronoun]} down and pass it around, #{values[:result]} of beer on the wall.\n"
  end
end
