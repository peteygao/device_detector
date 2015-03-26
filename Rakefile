require 'bundler/gem_tasks'

require 'rspec/core'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

task default: :spec

task :detectable_names do
  require 'device_detector'
  bot_names = DeviceDetector::Bot.new.send(:regexes).map { |r| r['name'] }.uniq
  bot_names.delete('$1')
  client_names = DeviceDetector::Client.new.send(:regexes).map { |r| r['name'] }.uniq
  client_names.delete('$1')
  device_filepaths = DeviceDetector::Device.new.send(:filepaths)
  device_regexes = DeviceDetector::Device.load_regexes(device_filepaths)
  device_names = device_regexes.flat_map { |dn| dn.keys }.sort.uniq

  today = Date.today.strftime

  puts '## Detectable clients, bots and devices'
  puts
  puts "Updated on #{today}"
  puts
  puts '### Bots'
  puts
  puts bot_names.join(', ')
  puts
  puts '### Clients'
  puts
  puts client_names.join(', ')
  puts
  puts '### Devices'
  puts
  puts device_names.join(', ')
  puts
end

