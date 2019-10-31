# frozen_string_literal: true

class StringGenerator
  attr_reader :number, :values

  BOTTLES = 'bottles'
  BOTTLE = 'bottle'
  DEFAULT_PRONOUN = 'Take it down'
  ANOTHER_PRONOUN = 'Go to the store down'
  PRONOUN = 'Take one down'
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
        result: ending_row(BOTTLE)
      }
    elsif number == 1
      {
        title: number,
        bottle: BOTTLE,
        pronoun: DEFAULT_PRONOUN,
        text: number,
        result: 'no more bottles'
      }
    elsif number == 2
      {
        title: number,
        bottle: BOTTLES,
        pronoun: PRONOUN,
        text: number,
        result: ending_row(BOTTLE)
      }
    else
      {
        title: number,
        bottle: BOTTLES,
        pronoun: PRONOUN,
        text: number,
        result: ending_row(BOTTLES)
      }
    end
  end

  def ending_row(form)
    p form
    "#{BOTTLES_ARR[(number - 1)]} #{form}"
  end

  def string
    p number.zero?
    "#{values[:title]} #{values[:bottle] } of beer on the wall, #{values[:text]} #{values[:bottle]  } of beer.\n" +
    "#{values[:pronoun]} and pass it around, #{values[:result]} of beer on the wall.\n"
  end
end
