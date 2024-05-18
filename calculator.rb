require 'pry'

class NegativeArgument < StandardError;end

class Parser
  attr_accessor :arg, :negative

  def initialize(arg)
    @arg = arg
  end

  def handler
    args = arg.gsub("\n", ',').split(',')
    args.map { |arg| Parser.new(arg) }
  end

  def to_int
    @arg = arg.to_i
  end
end

class ArgumentParser
  class << self
    def parser(args)
      args.split(',').map do |arg|
        Parser.new(arg).handler
      end.flatten
    end
  end
end

class Calculator
  def add(args)
    invalid_args = []
    parsed_args = ArgumentParser.parser(args).map(&:to_int)

    parsed_args.each do |arg|
      invalid_args << arg if arg.negative?
    end

    if invalid_args.any?
      raise NegativeArgument.new(
        "You cant have negative numbers in input: #{invalid_args.join(',')}"
      )
    end

    parsed_args.sum
  end
end