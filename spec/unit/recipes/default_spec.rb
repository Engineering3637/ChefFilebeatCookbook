#
# Cookbook:: Filebeat
# Spec:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'Filebeat::default' do
  context 'When all attributes are default, on Ubuntu 18.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '18.04'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'default apt update' do
      expect(chef_run).to update_apt_update 'update_sources'
    end

    it "should install filebeat" do
      expect(chef_run).to install_package 'filebeat'
    end

    it "should enable filebeat service" do
      expect(chef_run).to enable_service "filebeat"
    end

    it "should start filebeat service" do
      expect(chef_run).to start_service "filebeat"
    end

    it 'should create proxy template' do
      expect(chef_run).to create_template('/etc/filebeat/filebeat.yml').with_variables(ELK_PrivateIP: "192.168.3.10")
    end



  end

end
