class NegativeArgument < StandardError; end
class InvalidInput < StandardError; end

class ArgumentParser
  DEFAULT_DELIMITER = ';'

  class << self
    def parser(args)
      expr = /(\d+)|(-\d+)/

      args.scan(expr).flatten.compact
    end
  end
end

class Calculator
  def add(args)
    invalid_args = []
    parsed_args = ArgumentParser.parser(args).map(&:to_i)

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