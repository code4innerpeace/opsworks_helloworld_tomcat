execute 'cd /opt/tomcat'
execute 'chgrp -R tomcat /opt/tomcat'
execute 'chmod -R g+r /opt/tomcat/conf'
execute 'chmod g+x /opt/tomcat/conf'
execute 'chown -R tomcat /opt/tomcat/webapps/'
execute 'chown -R tomcat /opt/tomcat/work/'
execute 'chown -R tomcat /opt/tomcat/temp/'
execute 'chown -R tomcat /opt/tomcat/logs/'

template '/etc/systemd/system/tomcat.service' do
  source 'tomcat.service.erb'
end

# TODO: NOT DESIRED STATE
execute 'systemctl daemon-reload'

service 'tomcat' do
  action [:start, :enable]
end
