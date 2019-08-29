#
# Cookbook:: Filebeat
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.


# COPY SSL CERTIFICATE

directory '/etc/pki/' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory '/etc/pki/tls/' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

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

apt_update 'update_sources' do
  action :update
end

package 'filebeat'

service 'filebeat' do
  action [:enable, :start]
end


template '/etc/filebeat/filebeat.yml' do
  source 'filebeat.yml'
  variables ELK_PrivateIP: node['filebeat']['ELK_PrivateIP']
  notifies :restart, 'service[filebeat]'
end

execute 'update filebeat' do
  command 'update-rc.d filebeat defaults 95 10'
end
