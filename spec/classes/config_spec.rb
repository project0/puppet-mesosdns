require 'spec_helper'

describe 'mesosdns::config', type: :class do
  let :facts do
    {
      service_provider: 'systemd',
      path: '/bin:/usr/bin',
    }
  end

  # default params
  let :params do
    {
      ensure: 'present',
      config: '/etc/mesos-dns/config.json',
      path: '/etc/mesos-dns/',
      mesos_master: ['localhost:5050'],
      zk_detection_timeout: 30,
      refresh_seconds: 60,
      state_timeout_seconds: 300,
      ttl: 60,
      domain: 'mesos',
      port: 53,
      resolvers: ['8.8.8.8'],
      timeout: 5,
      listener: '0.0.0.0',
      dns_on: true,
      http_on: true,
      http_port: 8123,
      external_on: true,
      soa_mname: 'ns1.mesos.',
      soa_rname: 'root.ns1.mesos.',
      soa_refresh: 60,
      soa_retry: 600,
      soa_expire: 86400,
      soa_minttl: 60,
      recurse_on: true,
      enforce_rfc952: false,
      ip_sources: ['netinfo', 'mesos', 'host'],
    }
  end

  context ':ensure => present, default params' do
    it 'Will create /etc/mesos-dns/config.json' do
      is_expected.to contain_file('/etc/mesos-dns/config.json').with(ensure: 'file',
                                                                     path: '/etc/mesos-dns/config.json')
    end

    it 'Config should not contain config' do
      is_expected.to contain_file('/etc/mesos-dns/config.json').without_content(/"(zk|zkDetectionTimeout)":/)
    end

    it 'Config should contain config' do
      is_expected.to contain_file('/etc/mesos-dns/config.json').with_content(/^  "masters": \["localhost:5050"\],$/)
      is_expected.to contain_file('/etc/mesos-dns/config.json').with_content(/^  "refreshSeconds": 60,$/)
      is_expected.to contain_file('/etc/mesos-dns/config.json').with_content(/^  "stateTimeoutSeconds": 300,$/)
      is_expected.to contain_file('/etc/mesos-dns/config.json').with_content(/^  "ttl": 60,$/)
      is_expected.to contain_file('/etc/mesos-dns/config.json').with_content(/^  "domain": "mesos",$/)
      is_expected.to contain_file('/etc/mesos-dns/config.json').with_content(/^  "port": 53,$/)
      is_expected.to contain_file('/etc/mesos-dns/config.json').with_content(/^  "resolvers": \["8.8.8.8"\],$/)
      is_expected.to contain_file('/etc/mesos-dns/config.json').with_content(/^  "timeout": 5,$/)
      is_expected.to contain_file('/etc/mesos-dns/config.json').with_content(/^  "listener": "0.0.0.0",$/)
      is_expected.to contain_file('/etc/mesos-dns/config.json').with_content(/^  "dnson": true,$/)
      is_expected.to contain_file('/etc/mesos-dns/config.json').with_content(/^  "httpon": true,$/)
      is_expected.to contain_file('/etc/mesos-dns/config.json').with_content(/^  "httpport": 8123,$/)
      is_expected.to contain_file('/etc/mesos-dns/config.json').with_content(/^  "externalon": true,$/)
      is_expected.to contain_file('/etc/mesos-dns/config.json').with_content(/^  "SOAMname": "ns1.mesos.",$/)
      is_expected.to contain_file('/etc/mesos-dns/config.json').with_content(/^  "SOARname": "root.ns1.mesos.",$/)
      is_expected.to contain_file('/etc/mesos-dns/config.json').with_content(/^  "SOARefresh": 60,$/)
      is_expected.to contain_file('/etc/mesos-dns/config.json').with_content(/^  "SOARetry": 600,$/)
      is_expected.to contain_file('/etc/mesos-dns/config.json').with_content(/^  "SOAExpire": 86400,$/)
      is_expected.to contain_file('/etc/mesos-dns/config.json').with_content(/^  "SOAMinttl": 60,$/)
      is_expected.to contain_file('/etc/mesos-dns/config.json').with_content(/^  "recurseon": true,$/)
      is_expected.to contain_file('/etc/mesos-dns/config.json').with_content(/^  "enforceRFC952": false,$/)
      is_expected.to contain_file('/etc/mesos-dns/config.json').with_content(/^  "IPSources": \["netinfo", "mesos", "host"\]$/)
    end
  end
end
