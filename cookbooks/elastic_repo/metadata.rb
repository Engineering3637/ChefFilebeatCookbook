name 'elastic_repo'
maintainer 'Virender Khatri'
maintainer_email 'vir.khatri@gmail.com'
license 'Apache-2.0'
description 'Installs/Configures Elastic APT/Yum Repository'
long_description 'Installs/Configures Elastic APT/Yum Repository'
version '1.1.1'
source_url 'https://github.com/vkhatri/chef-elastic-repo' if respond_to?(:source_url)
issues_url 'https://github.com/vkhatri/chef-elastic-repo/issues' if respond_to?(:issues_url)
chef_version '>= 12.14' if respond_to?(:chef_version)

%w[debian ubuntu centos amazon redhat fedora].each do |os|
  supports os
end
