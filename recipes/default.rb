# frozen_string_literal: true

ruby_block 'Save node attributes' do
  action :run
  block do
    parent = node['export-node']['location']

    if Dir.exist?(parent)
      output_path = File.join(parent, 'chef_node.json')
      Chef::Log.info "Writing node attributes to #{output_path} ..."
      IO.write(output_path, node.to_json)
    else
      Chef::Log.warn 'The node attributes have not been exported as the ' \
                     "output folder #{parent} doesn't exists."
    end
  end
end
