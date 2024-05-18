class Calculator
  def add(args)
    args.split(",").map(&:to_i).sum
  end
end