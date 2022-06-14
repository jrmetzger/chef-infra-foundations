#!/bin/bash

# run hello.rb file and verify
#chef-client --chef-license accept --local-mode hello.rb
#gc hello.txt

# run goodbye.rb file and verify
#chef-client --local-mode goodbye.rb
#Test-Path hello.txt

# run disable-uac.rb
#chef-client --local-mode disable-uac.rb
# run in cookbook
#chef-client --local-mode --runlist "recipe[workstation::disable-uac]"

# Create Cookbook
#chef generate cookbook cookbooks/iis

# Benefit to use include_recipe, runs default.rb and runs each in sequence

# Version in metadata.rb

#chef generate recipe cookbooks/iis server

# cookstyle to check formatting, -a to autocorrect
#cookstyle -a

# Create kitchen.yml
# Copy from ~/kitchen-template.yml to cookbooks/workstation/kitchen.yml
#cd cookbooks/workstation
#kitchen create
#kitchen converge
#kitchen verify
#kitchen destroy


# Run Apache Lab
sudo chef-client --local-mode --runlist "recipe[apache]"
