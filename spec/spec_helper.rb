$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'coco'
require 'json2'

RSpec.configure do |config|
  if config.files_to_run.one?
    config.default_formatter = 'documentation'
  end
end
