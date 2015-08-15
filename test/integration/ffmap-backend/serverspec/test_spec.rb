require 'serverspec'

# Required by serverspec
set :backend, :exec

describe package('python3') do
  it { should be_installed }
end

describe file('/opt/ffmap-backend/backend.py') do
  it { should exist }
end

describe file('/etc/cron.d/ffmap-backend') do
  it { should exist }
  it { should contain '* * * * * root /opt/ffmap-backend/backend.py -d /srv/ffmap-data -p 14' }
end