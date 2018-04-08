require 'spec_helper'

describe 'swatch' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "swatch class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('swatch::params') }
          it { is_expected.to contain_class('swatch::install').that_comes_before('swatch::config') }
          it { is_expected.to contain_class('swatch::config') }
          it { is_expected.to contain_class('swatch::service').that_subscribes_to('swatch::config') }

          it { is_expected.to contain_service('swatch') }
          it { is_expected.to contain_package('swatch').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'swatch class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('swatch') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
