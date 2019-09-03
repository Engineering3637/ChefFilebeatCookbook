# # Cookbook:: Filebeat
# # Recipe:: default
# #
# # Copyright:: 2019, The Authors, All Rights Reserved.
# # include_recipe 'filebeat::default'
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
template '/tmp/logstash-forwarder.crt /etc/pki/tls/certs/logstash-forwarder.crt' do
  source 'logstash-forwarder.crt.erb'
end
#
# execute 'Retrieve and install Filebeat' do
#   command 'wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -'
#   command 'sudo apt-get install apt-transport-https'
#   command 'echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list'
#   command 'sudo apt-get update && sudo apt-get install filebeat'
#   command 'sudo apt-get update'
# end
#
# apt_package 'filebeat' do
#   action :install
# end
#
template '/etc/filebeat/filebeat.yml' do
  source 'filebeat.yml.erb'
end

# execute 'Restart filebeat' do
#   command 'sudo service filebeat restart'
#   command 'sudo update-rc.d filebeat defaults 95 10'
# end
execute 'install filebeat' do
    command 'wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add –'
    command 'sudo apt-get install apt-transport-https'
    command 'echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list'
    command 'sudo apt-get update'
    command 'sudo apt-get install filebeat'
    command 'sudo service filebeat start'
    command 'sudo update-rc.d filebeat defaults 95 10'
end
