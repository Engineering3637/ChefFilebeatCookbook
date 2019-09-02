# Cookbook:: Filebeat
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

template '/tmp/logstash-forwarder.crt' do
  source 'logstash-forwarder.crt.erb'
end

execute 'Move certificate and install filebeats' do
  command 'mkdir -p /etc/pki/tls/certs'
  command 'sudo cp /tmp/logstash-forwarder.crt /etc/pki/tls/certs/'
  # command 'wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -'
  # command 'sudo apt-get install apt-transport-https'
  # command 'echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list'
  # command 'sudo apt-get update && sudo apt-get install filebeat'
  # command 'sudo apt-get update'
  # command 'sudo apt-get install filebeat'
end

filebeat_install 'default'

template '/etc/filebeat/filebeat.yml' do
  source 'filebeat.yml.erb'
end

execute 'Restart filebeat' do
  command 'sudo service filebeat restart'
  command 'sudo +-rc.d filebeat defaults 95 10'
end
