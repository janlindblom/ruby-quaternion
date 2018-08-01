class Quaternion
  VERSION = '0.0.1'.freeze

  # @return [Numeric] real component a
  attr_accessor :a
  # @return [Numeric] imaginary component b
  attr_accessor :b
  # @return [Numeric] imaginary component c
  attr_accessor :c
  # @return [Numeric] imaginary component d
  attr_accessor :d

  def initialize(a = nil, b = nil, c = nil, d = nil)
    @a = 0
    @b = 0
    @c = 0
    @d = 0
    @a = a unless a.nil?
    @b = b unless b.nil?
    @c = c unless c.nil?
    @d = d unless d.nil?
  end

  # Returns a string representing _obj_.
  #
  # @return [String] string representing _obj_.
  def to_s
    return '0' if zero?
    "(#{format_number @a, false} + #{format_number @b}i + #{format_number @c}j + #{format_number @d}k)"
  end

  # Returns a string containing a human-readable representation of _obj_.
  #
  # @return [String] a string containing a human-readable representation of _obj_.
  def inspect
    to_s
  end

  # Returns the conjugate of _obj_ *q* which is the quaternion
  # q∗ = *a* − *b*_i_ − *c*_j_ − *d*_k_.
  #
  # @return [Quaternion] the conjugate of _obj_.
  def conjugate
    Quaternion.new(@a, -1 * @b, -1 * @c, -1 * @d)
  end

  def norm
    Math.sqrt(@a**2 + @b**2 + @c**2 + @d**2)
  end

  def versor
    self / norm
  end

  def +(other)
    r = Quaternion.new
    r.a = (@a + other.a)
    r.b = (@b + other.b)
    r.c = (@c + other.c)
    r.d = (@d + other.d)
    r
  end

  def *(other)
    r = Quaternion.new
    if other.is_a? Quaternion
      a1 = @a
      a2 = other.a
      b1 = @b
      b2 = other.b
      c1 = @c
      c2 = other.c
      d1 = @d
      d2 = other.d
      r.a = (a1 * a2 - b1 * b2 - c1 * c2 - d1 * d2)
      r.b = (a1 * b2 + b1 * a2 + c1 * d2 - d1 * c2)
      r.c = (a1 * c2 - b1 * d2 + c1 * a2 + d1 * b2)
      r.d = (a1 * d2 + b1 * c2 - c1 * b2 + d1 * a2)
    elsif other.is_a? Numeric
      r.a = other * @a
      r.b = other * @b
      r.c = other * @c
      r.d = other * @d
    end

    r
  end

  def /(other)
    r = Quaternion.new
    if other.real?
      r = self * (1 / other.a)
    elsif other.is_a? Numeric
      r = self * (1 / other)
    end
    r
  end

  def eql?(other)
    return true if @a == other.a && @b == other.b && @c == other.c && @d == other.d
    false
  end

  def equal?(other)
    eql?(other)
  end

  def ==(other)
    eql?(other)
  end

  def identity_element?
    return true if @a == 1 && @b == 0 && @c == 0 && @d == 0
    false
  end

  def zero?
    return true if @a == 0 && @b == 0 && @c == 0 && @d == 0
    false
  end

  def real?
    return true if @b == 0 && @c == 0 && @d == 0
    false
  end

  def imaginary?
    return true if @a == 0 && (@b != 0 || @c != 0 || @d != 0)
    false
  end

  def self.zero
    Quaternion.new
  end

  private

  def format_number(number, omit = true)
    return '' if omit && (number == 1 || number == 1.0)
    number.to_s
  end
end
