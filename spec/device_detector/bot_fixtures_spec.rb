require_relative '../spec_helper'

describe DeviceDetector::Bot do
  fixture_dir = File.expand_path('../fixtures/parser', __dir__)
  fixture_files = Dir["#{fixture_dir}/bots.yml"]
  fixture_files.each do |fixture_file|
    describe File.basename(fixture_file) do
      fixtures = YAML.load_file(fixture_file)

      fixtures.each do |f|
        user_agent = f['user_agent']
        headers = f['headers']

        device = DeviceDetector.new(user_agent, headers)

        describe user_agent do
          it 'should be a bot' do
            assert device.bot?, "isn't a bot"
          end

          it 'should have the expected name' do
            assert_equal f['bot']['name'], device.name, 'failed bot name detection'
          end
        end
      end
    end
  end
end
