require "bundler/setup"
Bundler.require
require File.join(File.dirname(__FILE__), "yuno.rb")

use Rack::CommonLogger
map '/yuno' do
  run Yuno
end