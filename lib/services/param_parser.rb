# frozen_string_literal: true

class ParamParser
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def call
    p params
  end
end
