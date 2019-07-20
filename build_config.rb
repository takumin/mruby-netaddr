def gem_config(conf)
  conf.gem File.expand_path(File.dirname(__FILE__))
end

MRuby::Build.new do |conf|
  toolchain :gcc
  gem_config(conf)
  enable_debug
  conf.enable_test
end
