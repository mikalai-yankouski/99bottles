# frozen_string_literal: true

class StringGenerator
  attr_reader :number, :string_params, :remainder

  BOTTLES = 'bottles'
  BOTTLE = 'bottle'

  def initialize(number)
    @number = number
    @remainder = @number - 1
  end

  def call
    return number_zero_string if number.zero?
    return remainder_zero_string if remainder.zero?
    default_string
  end

  private

  def number_zero_string
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def remainder_zero_string
    "#{number} #{bottles_one?(number)} of beer on the wall, #{number} #{bottles_one?(number)} of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def default_string
    "#{number} #{bottles_one?(number)} of beer on the wall, #{number} #{bottles_one?(number)} of beer.\n" \
    "Take one down and pass it around, #{remainder} #{bottles_one?(remainder)} of beer on the wall.\n"
  end

  def bottles_one?(number)
    number == 1 ? BOTTLE : BOTTLES
  end

  # def string
  #   "#{string_params[:title]} #{string_params[:bottle]} of beer on the wall, " \
  #   "#{string_params[:text]} #{string_params[:bottle]} of beer.\n" \
  #   "#{string_params[:pronoun]} #{string_params[:middleware]}, #{string_params[:ending]} of beer on the wall.\n"
  # end
end
