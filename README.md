my_chef_repo
============

This is the sandbox to learn chef, berkshef, and vagrant.

# Requirements

* ruby
* bundler

# How To Install
```zsh
git clone https://github.com/mgi166/my_chef_repo.git
cd my_chef_repo
bundle install --path vendor/bundle
bundle exec berks install --path vendor/cookbooks
```

All gems and cookbooks is installed under vendor path, so don't pollute your environment.

# Cook

```zsh
bundle exec knife solo prepare {hostname}
bundle exec knife solo cook {hostname}
```
