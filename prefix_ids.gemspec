# frozen_string_literal: true

require_relative 'lib/prefix_ids/version'

Gem::Specification.new do |spec|
  spec.name        = 'prefix_ids'
  spec.version     = PrefixIds::VERSION
  spec.authors     = ['Saikus08']
  spec.email       = ['agustinvignolosotelo@gmail.com']
  spec.license     = 'MIT'
  spec.summary     = 'A gem to add prefix IDs to your Rails models'
  spec.description = 'This gem provides functionality to add prefix IDs to your Rails models, making it easier to identify records.'

  spec.metadata['homepage_uri'] = 'https://github.com'
  spec.metadata['source_code_uri'] = 'https://github.com'
  spec.metadata['changelog_uri'] = 'https://github.com'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency 'rails', '>= 7.0.8'
end
