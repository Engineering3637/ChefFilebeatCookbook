#
# Cookbook:: Filebeat
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

template '/tmp/logstash-forwarder.crt' do
  source 'logstash-forwarder.crt.erb'
end

execute 'Move certificate and install filebeats' do
  command 'sudo mkdir -p /etc/pki/tls/certs'
  command 'sudo cp /tmp/logstash-forwarder.crt /etc/pki/tls/certs/'
  command 'echo "deb https://packages.elastic.co/beats/apt stable main" |  sudo tee -a /etc/apt/sources.list.d/beats.list'
  command 'wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -'
  command 'sudo apt-get update'
  command 'sudo apt-get install filebeat'
end

template '/etc/filebeat/filebeat.yml' do
  source 'filebeat.yml.erb'
end

execute 'Restart filebeat' do
  command 'sudo service filebeat restart'
  command 'sudo update-rc.d filebeat defaults 95 10'
end
