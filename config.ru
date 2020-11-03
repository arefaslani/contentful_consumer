require 'rubygems'
require 'bundler/setup'
require 'dotenv/load'

Bundler.require(:default)

loader = Zeitwerk::Loader.new
loader.push_dir("config")
loader.push_dir("app/services")
loader.push_dir("app/models")
loader.push_dir("app/normalizers")
loader.enable_reloading
loader.setup

if ENV['RACK_ENV'] == 'production'
  Zeitwerk::Loader.eager_load_all
  run Application.freeze.app
else
  run ->(env) {
    loader.reload
    Application.call(env)
  }
end
