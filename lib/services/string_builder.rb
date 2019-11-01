# frozen_string_literal: true

class StringBuilder
  attr_reader :number, :remainder

  BOTTLES = 'bottles'
  BOTTLE = 'bottle'
  DEFAULT_PRONOUN = 'Take it down'
  ANOTHER_PRONOUN = 'Go to the store'
  PRONOUN = 'Take one down'
  ZERO_TITLE = 'No more'
  PASS_IT_ARROUND = 'and pass it around'
  BUY_MORE_BEER = 'and buy some more'

  BOTTLES_ARR = (0...100).to_a

  def initialize(number)
    @number = number
    @remainder = @number - 1
  end

  def call
    genreate_default_string_params
  end

  private

  def genreate_default_string_params
    if number.zero?
      {
        title: ZERO_TITLE,
        bottle: bottles_one?(number),
        pronoun: ANOTHER_PRONOUN,
        text: ZERO_TITLE.downcase,
        middleware: BUY_MORE_BEER,
        ending: ending_row
      }
    elsif number == 1
      {
        title: number,
        bottle: bottles_one?(number),
        pronoun: DEFAULT_PRONOUN,
        text: number,
        middleware: PASS_IT_ARROUND,
        ending: ending_row
      }
    elsif number == 2
      {
        title: number,
        bottle: bottles_one?(number),
        pronoun: PRONOUN,
        text: number,
        middleware: PASS_IT_ARROUND,
        ending: ending_row
      }
    else
      {
        title: number,
        bottle: bottles_one?(number),
        pronoun: PRONOUN,
        text: number,
        middleware: PASS_IT_ARROUND,
        ending: ending_row
      }
    end
  end

  def bottles_one?(number)
    number == 1 ? BOTTLE : BOTTLES
  end

  def ending_row
    return 'no more bottles' if remainder.zero?

    "#{BOTTLES_ARR[remainder]} #{bottles_one?(remainder)}"
  end
end
