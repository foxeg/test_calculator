class Float
  PRECISION = 1e-4

  def round_to(x)
    (self * 10**x).round.to_f / 10**x
  end

  def ceil_to(x)
    # handle 2.0000011 situation
    if (self.round_to(2) - self).abs < PRECISION
      self.round_to(2)
    else
      (self * 10**x).ceil.to_f / 10**x
    end
  end

  def floor_to(x)
    # handle 1.99999944 situation
    if (self.round_to(2) - self).abs < PRECISION
      self.round_to(2)
    else
      (self * 10**x).floor.to_f / 10**x
    end
  end
end