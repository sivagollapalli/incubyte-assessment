require 'pry'

class Parser
  attr_accessor :arg

  def initialize(arg)
    @arg = arg
  end

  def handler
    arg.gsub("\n", ',').split(',')
  end
end

class ArgumentParser
  class << self
    def parser(args)
      args.split(',').map { |arg| Parser.new(arg).handler }.flatten
    end
  end
end

class Calculator
  def add(args)
    ArgumentParser.parser(args).map(&:to_i).sum
  end
end