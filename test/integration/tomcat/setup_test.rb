describe package('java-1.7.0-openjdk-devel') do
  it { should be_installed }
end

describe group('tomcat') do
  it { should exist }
end

describe user('tomcat') do
  it { should exist }
  its('group') { should eq 'tomcat' }
  its('home') { should eq '/opt/tomcat' }
end

describe file('/opt/tomcat') do
  it { should exist }
  its('type') { should cmp 'directory' }
end

describe file('/opt/tomcat/conf') do
  it { should exist }
  its('type') { should cmp 'directory' }
end
