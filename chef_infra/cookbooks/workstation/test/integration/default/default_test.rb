# Chef InSpec test for recipe workstation::default

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

system_policies = 'HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System'

describe registry_key('System Policies', system_policies) do
  its('EnableLUA') { should eq 0 }
  its('ConsentPromptDebahviorAdmin') { should eq 0 }
end

