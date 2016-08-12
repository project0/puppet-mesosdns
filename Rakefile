require 'rspec-puppet/rake_task'
require 'puppetlabs_spec_helper/rake_tasks'
require 'metadata-json-lint/rake_task'
require 'puppet-lint/tasks/puppet-lint'

PuppetLint.configuration.log_format = '%{path}:%{linenumber}  :%{check}:%{KIND}:%{message}'
PuppetLint.configuration.send('disable_class_inherits_from_params_class')
PuppetLint.configuration.ignore_paths = ['spec/**/*.pp', 'pkg/**/*.pp']
PuppetLint.configuration.fail_on_warnings = true

desc 'Run acceptance tests'
RSpec::Core::RakeTask.new(:acceptance) do |t|
  t.pattern = 'spec/acceptance'
end

desc 'Run metadata_lint, lint, syntax, and spec tests.'
task test: [
  :metadata_lint,
  :lint,
  :syntax,
  :spec
]
