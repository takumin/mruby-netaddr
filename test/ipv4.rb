assert("NetAddr::IPv4.new") do
  ip = NetAddr::IPv4.new(0x80000001)
  assert_equal("128.0.0.1", ip.to_s)

  assert_raise(NetAddr::ValidationError){ NetAddr::IPv4.new(0x8000000001) }
  assert_raise(NetAddr::ValidationError){ NetAddr::IPv4.new(-1) }
  assert_raise(NetAddr::ValidationError){ NetAddr::IPv4.new("128.0.0.1") } # string
end

assert("NetAddr::IPv4.parse") do
  assert_equal("128.0.0.1", NetAddr::IPv4.parse("128.0.0.1").to_s)
  assert_equal("0.0.0.0", NetAddr::IPv4.parse("0.0.0.0").to_s)

  assert_raise(NetAddr::ValidationError){ NetAddr::IPv4.parse("128.0.0.1a") }
  assert_raise(NetAddr::ValidationError){ NetAddr::IPv4.parse("256.0.0.1") }
  assert_raise(NetAddr::ValidationError){ NetAddr::IPv4.parse("128.0.0.1.1") }
  assert_raise(NetAddr::ValidationError){ NetAddr::IPv4.parse("128") }
end

assert("NetAddr::IPv4.cmp") do
  ip = NetAddr::IPv4.parse("128.0.0.1")
  ip2 = NetAddr::IPv4.parse("128.0.0.0")
  ip3 = NetAddr::IPv4.parse("128.0.0.2")
  ip4 = NetAddr::IPv4.parse("128.0.0.1")
  assert_equal(1, ip.cmp(ip2))
  assert_equal(-1, ip.cmp(ip3))
  assert_equal(0, ip.cmp(ip4))
end

assert("NetAddr::IPv4.multicast_mac") do
  assert_equal(0, NetAddr::IPv4.parse("223.255.255.255").multicast_mac.addr)
  assert_equal("01-00-5e-00-00-00", NetAddr::IPv4.parse("224.0.0.0").multicast_mac.to_s)
  assert_equal("01-00-5e-02-03-05", NetAddr::IPv4.parse("230.2.3.5").multicast_mac.to_s)
  assert_equal("01-00-5e-13-12-17", NetAddr::IPv4.parse("235.147.18.23").multicast_mac.to_s)
  assert_equal("01-00-5e-7f-ff-ff", NetAddr::IPv4.parse("239.255.255.255").multicast_mac.to_s)
  assert_equal(0, NetAddr::IPv4.parse("240.0.0.0").multicast_mac.addr)
end

assert("NetAddr::IPv4.next") do
  assert_equal("255.255.255.255", NetAddr::IPv4.parse("255.255.255.254").next().to_s)
  assert_nil(NetAddr::IPv4.parse("255.255.255.255").next())
end

assert("NetAddr::IPv4.prev") do
  assert_equal("0.0.0.0", NetAddr::IPv4.parse("0.0.0.1").prev().to_s)
  assert_nil(NetAddr::IPv4.parse("0.0.0.0").prev())
end

assert("NetAddr::IPv4.to_net") do
  ip = NetAddr::IPv4.parse("192.168.1.1")
  net = NetAddr::IPv4Net.parse("192.168.1.1")
  assert_equal(0, net.cmp(ip.to_net()))
end
