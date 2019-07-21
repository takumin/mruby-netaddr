assert("NetAddr::Mask128.new") do
  m128 = NetAddr::Mask128.new(24)
  assert_equal("/24", m128.to_s)
  assert_equal(0xffffff00000000000000000000000000, m128.mask)

  assert_raise(NetAddr::ValidationError){ NetAddr::Mask128.new(-1) }
  assert_raise(NetAddr::ValidationError){ NetAddr::Mask128.new(129) }
  assert_raise(NetAddr::ValidationError){ NetAddr::Mask128.new("/24") }
end

assert("NetAddr::Mask128.parse") do
  m128 = NetAddr::Mask128.parse("/24")
  assert_equal("/24", m128.to_s)

  m128 = NetAddr::Mask128.parse("24")
  assert_equal("/24", m128.to_s)

  assert_raise(NetAddr::ValidationError){ NetAddr::Mask128.parse("/129") }
end

assert("NetAddr::Mask128.cmp") do
  m = NetAddr::Mask128.new(24)
  m2 = NetAddr::Mask128.new(25)
  m3 = NetAddr::Mask128.new(23)
  m4 = NetAddr::Mask128.new(24)
  assert_equal(1, m.cmp(m2))
  assert_equal(-1, m.cmp(m3))
  assert_equal(0, m.cmp(m4))
end

assert("NetAddr::Mask128.len") do
  m = NetAddr::Mask128.new(65)
  assert_equal(2**(128-65), m.len())

  m = NetAddr::Mask128.new(64)
  assert_equal(0, m.len())
end
