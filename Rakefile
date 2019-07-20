# variables
ENV['APP_NAME']        ||= File.basename(File.expand_path(__FILE__))
ENV['APP_ROOT']        ||= File.dirname(File.expand_path(__FILE__))
ENV['MRUBY_ROOT']      ||= "#{ENV['APP_ROOT']}/mruby"
ENV['MRUBY_CONFIG']    ||= "#{ENV['APP_ROOT']}/build_config.rb"
ENV['MRUBY_BUILD_DIR'] ||= "#{ENV['APP_ROOT']}/build"
ENV['INSTALL_DIR']     ||= "#{ENV['APP_ROOT']}/bin"

# mruby
unless File.exist?("#{ENV['MRUBY_ROOT']}/build_config.rb")
  sh "git clone --branch stable --depth 1 https://github.com/mruby/mruby.git #{ENV['MRUBY_ROOT']}"
end

# build
import "#{ENV['MRUBY_ROOT']}/Rakefile"
