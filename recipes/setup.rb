package 'java-1.7.0-openjdk-devel'

group 'tomcat'

user 'tomcat' do
  manage_home false
  shell '/bin/nologin'
  group 'tomcat'
  home '/opt/tomcat'
end

# Tomcat http://apache.mirrors.hoobly.com/tomcat/tomcat-8/v8.0.51/bin/apache-tomcat-8.0.51.tar.gz
remote_file 'apache-tomcat-8.0.51.tar.gz' do
  source 'http://apache.mirrors.hoobly.com/tomcat/tomcat-8/v8.0.51/bin/apache-tomcat-8.0.51.tar.gz'
end

directory '/opt/tomcat' do
  # action :create
end

# TODO: NOT DESIRED STATE
execute 'tar xvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1'
