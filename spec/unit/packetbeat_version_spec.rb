require 'spec_helper'
describe 'packetbeat_version' do
  before do
    Facter.clear
  end

  context 'on Linux OS' do
    before do
      Facter.fact(:kernel).stubs(:value).returns('Linux')
      Facter::Util::Resolution.stubs(:exec).with('/usr/share/packetbeat/bin/packetbeat -version').returns('packetbeat version 5.2.0 (amd64), libbeat 5.2.0')
    end

    it do
      expect(Facter.fact(:packetbeat_version).value).to eq('5.2.0')
    end
  end
end