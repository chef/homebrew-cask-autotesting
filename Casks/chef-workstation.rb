cask 'chef-workstation' do
  version '0.17.5'
  sha256 'invalid, testing'

  url "https://packages.chef.io/files/stable/chef-workstation/#{version}/mac_os_x/10.13/chef-workstation-#{version}-1.dmg"
  appcast 'https://omnitruck.chef.io/stable/chef-workstation/metadata?p=mac_os_x&pv=10.14&m=x86_64&v=latest'
  name 'Chef Workstation'
  homepage 'https://docs.chef.io/workstation/'

  depends_on macos: '>= :high_sierra'

  pkg "chef-workstation-#{version}-1.pkg"

  uninstall quit:      'sh.chef.chef-workstation',
            pkgutil:   'com.getchef.pkg.chef-workstation',
            launchctl: 'io.chef.chef-workstation.app',
            script:    {
                         executable: '/opt/chef-workstation/bin/uninstall_chef_workstation',
                         sudo:       true,
                       }

  zap trash: '~/.chef-workstation/'
end
