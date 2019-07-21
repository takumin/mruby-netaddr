MRuby::Gem::Specification.new('mruby-netaddr') do |spec|
  spec.license = 'Apache 2.0'
  spec.author  = [
    'Dustin Spinhirne',
    'Takumi Takahashi',
  ]
  spec.summary = 'A Ruby library for performing calculations on IPv4 and IPv6 subnets.'

  spec.add_dependency 'mruby-kernel-ext',  core: 'mruby-kernel-ext'
  spec.add_dependency 'mruby-string-ext',  core: 'mruby-string-ext'
  spec.add_dependency 'mruby-onig-regexp', mgem: 'mruby-onig-regexp'
end
