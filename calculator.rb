class NegativeArgument < StandardError; end

class ArgumentParser
  class << self
    def parser(args)
      expr = /(\d+\.\d+)|(-\d+)|(\d+)/

      args.scan(expr).flatten.compact
    end
  end
end

class Calculator
  def add(args)
    invalid_args = []
    parsed_args = ArgumentParser.parser(args)

    parsed_args.each do |arg|
      invalid_args << arg if arg.to_f.negative?
    end

    if invalid_args.any?
      raise NegativeArgument.new(
        "You cant have negative numbers in input: #{invalid_args.join(',')}"
      )
    end

    sum = parsed_args.map(&:to_f).sum
    
    (sum == sum.to_i) ? sum.to_i : sum
  end
end

# puts Calculator.new.add(ARGV[0]) Enable this if you want the run program