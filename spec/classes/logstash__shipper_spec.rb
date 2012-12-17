require 'spec_helper'

describe 'logstash::shipper', :type => :class do
  let(:facts) { {:osfamily => 'Debian', :lsbdistcodename => 'precise'} }
  it { should include_class('logstash::params') }
  it { should include_class('logstash') }
  it { should contain_package('java') }
  it { should contain_exec('download logstash jar').with_creates("/usr/local/bin/logstash-1.1.5-monolithic.jar")}
  it { should contain_file('/etc/init.d/logstash-shipper').with_content(/LOGSTASH_BIN="\/usr\/bin\/java -- -jar \/usr\/local\/bin\/logstash-1.1.5-monolithic.jar/) }
end
