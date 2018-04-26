%w[webapps work temp logs].each do |path|
  describe file("/opt/tomcat/#{path}") do
    it { should exist }
    its('type') { should cmp 'directory' }
    its('owner') { should eq 'tomcat' }
  end
end

describe systemd_service('tomcat') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe port(8080) do
  it { should be_listening }
end
