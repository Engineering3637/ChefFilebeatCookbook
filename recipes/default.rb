#
# Cookbook:: Filebeat
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.


# COPY SSL CERTIFICATE

directory '/etc/pki/tls/certs' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

apt_repository 'filebeat' do
  uri 'https://packages.elastic.co/beats/apt stable main'
  key 'https://packages.elastic.co/GPG-KEY-elasticsearch'
  trusted false
  components ['filebeat']
end

package 'filebeat'

template '/etc/filebeat/filebeat.yml' do
  source 'filebeat.yml'
end
