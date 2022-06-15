#
# Cookbook:: myhaproxy
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

haproxy_install 'package'

haproxy_frontend 'http-in' do
  bind '*:80'
  default_backend 'server_backend'
end

web_nodes = search('node', "policy_name:company_web AND policy_group:#{node.policy_group}")
servers = []

web_nodes.each do |web_node|
  server = "#{web_node['cloud']['public_hostname']} #{web_node['cloud']['public_ipv4']}:80 maxconn 32"
  servers.push(server)
end

haproxy_backend 'servers' do 
  server servers
end

haproxy_service 'haproxy' do
  subscribes :reload, 'template[/etc/haproxy/haproxy.cfg]', :delayed
end
