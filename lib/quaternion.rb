# frozen_string_literal: true

# Ruby representation of quaternions.
#
# @author Jan Lindblom <janlindblom@fastmail.fm>
class Quaternion
  # Current version of the Quaternion gem
  VERSION = '0.1.0'

  # @return [Numeric] real component a
  attr_accessor :a

  # @return [Numeric] scalar component b
  attr_accessor :b

  # @return [Numeric] scalar component c
  attr_accessor :c

  # @return [Numeric] scalar component d
  attr_accessor :d

  #
  # Create a new Quaternion
  #
  # @param [Integer] a real component _a_
  # @param [Integer] b scalar component _b_
  # @param [Integer] c scalar component _c_
  # @param [Integer] d scalar component _d_
  #
  def initialize(a = 0, b = 0, c = 0, d = 0)
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

    format_number(@a, false) + sign_as_per(@b) + format_number(@b.abs) + 'i' +
      sign_as_per(@c) + format_number(@c.abs) + 'j' + sign_as_per(@d) +
      format_number(@d.abs) + 'k'
  end

  # Returns a string containing a human-readable representation of _obj_.
  #
  # @return [String] a string containing a human-readable representation of
  #   _obj_.
  def inspect
    "(#{self})"
  end

  # Returns the conjugate of _obj_ *q* which is the quaternion
  # q* = *a* - *b*_i_ - *c*_j_ - *d*_k_.
  #
  # @return [Quaternion] the conjugate of _obj_.
  def conjugate
    Quaternion.new(@a, -1 * @b, -1 * @c, -1 * @d)
  end

  #
  # Returns the norm of this Quaternion
  #
  # @return [Numeric] norm of this Quaternion.
  #
  def norm
    Math.sqrt(@a**2 + @b**2 + @c**2 + @d**2)
  end

  #
  # Returns the versor of this Quaternion
  #
  # @return [Quaternion] the versor of this Quaternion.
  #
  def versor
    self / norm
  end

  #
  # Unary add operator.
  #
  # @param [Quaternion,Numeric] other +Quaternion+ or +Numeric+ to add.
  #
  # @return [Quaternion] sum of this and _other_.
  #
  def +(other)
    return plus_minus(other, :plus) if other.is_a? Quaternion
    return plus_minus(Quaternion.new(other), :plus) if other.is_a? Numeric
  end

  #
  # Unary subtract operator.
  #
  # @param [Quaternion,Numeric] other +Quaternion+ or +Numeric+ to substract.
  #
  # @return [Quaternion] result of substracting _other_ from this
  #   +Quaternion+.
  #
  def -(other)
    return plus_minus(other, :minus) if other.is_a? Quaternion
    return plus_minus(Quaternion.new(other), :minus) if other.is_a? Numeric
  end

  #
  # Unary multiply operator.
  #
  # @param [Quaternion,Numberic] other +Quaternion+ or +Numeric+ to multiply
  #   by.
  #
  # @return [Quaternion] product of this and _other_.
  #
  def *(other)
    return hamilton_product(other) if other.is_a? Quaternion
    return scalar_product(other) if other.is_a? Numeric
  end

  #
  # Unary divide operator.
  #
  # @param [Quaternion,Numeric] other +Quaternion+ or +Numeric+ to divide by.
  #
  # @return [Quaternion] result of dividing this +Quaternion+ with _other_.
  #
  def /(other)
    return self * (1 / other.a) if other.real?
    return self * (1 / other) if other.is_a? Numeric
  end

  def eql?(other)
    if @a == other.a && @b == other.b && @c == other.c && @d == other.d
      return true
    end

    false
  end

  def equal?(other)
    eql?(other)
  end

  #
  # Check equality between this +Quaternion+ and _other_.
  #
  # @param [<Type>] other <description>
  #
  # @return [<Type>] <description>
  #
  def ==(other)
    eql?(other)
  end

  def identity_element?
    return true if @a == 1 && @b.zero? && @c.zero? && @d.zero?

    false
  end

  def zero?
    return true if @a.zero? && @b.zero? && @c.zero? && @d.zero?

    false
  end

  def real?
    return true if @b.zero? && @c.zero? && @d.zero?

    false
  end

  def imaginary?
    return true if @a.zero? && (@b != 0 || @c != 0 || @d != 0)

    false
  end

  #
  # Return a zero +Quaternion+.
  #
  # @return [Quaternion] Zero +Quaternion+.
  #
  def self.zero
    Quaternion.new
  end

  private

  def plus_minus(other, sign)
    if sign == :plus
      Quaternion.new((@a + other.a), (@b + other.b),
                     (@c + other.c), (@d + other.d))
    elsif sign == :minus
      Quaternion.new((@a + other.a), (@b + other.b),
                     (@c + other.c), (@d + other.d))
    end
  end

  def scalar_product(other)
    Quaternion.new(other * @a,
                   other * @b,
                   other * @c,
                   other * @d)
  end

  def hamilton_product(other)
    Quaternion.new((@a * other.a - @b * other.b - @c * other.c - @d * other.d),
                   (@a * other.b + @b * other.a + @c * other.d - @d * other.c),
                   (@a * other.c - @b * other.d + @c * other.a + @d * other.b),
                   (@a * other.d + @b * other.c - @c * other.b + @d * other.a))
  end

  def sign_as_per(number)
    return '-' if number.negative?

    '+'
  end

  def format_number(number, omit = true)
    return '' if omit && [1, 1.0].include?(number)

    number.to_s
  end
end
