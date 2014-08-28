cookbook_path    ["cookbooks", "site-cookbooks", "site-cookbooks/default"]
node_path        "nodes"
role_path        "roles"
environment_path "environments"
data_bag_path    "data_bags"
encrypted_data_bag_secret ".chef/data_bag_key"

knife[:berkshelf_path] = "vendor/cookbooks"
