# InSpec test for recipe Filebeat::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe port(80), :skip do
  it { should_not be_listening }
end

describe service "filebeat" do
  it { should be_running }
  it { should be_enabled }
end

describe port(5403) do
  it { should be_listening.on('0.0.0.0') }
end
