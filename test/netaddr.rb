assert_equal("128.0.0.1", NetAddr.parse_ip("128.0.0.1").to_s)
assert_equal("1::1", NetAddr.parse_ip("1::1").to_s)
