require_relative 'lib/mobile_text_alerts/version'

Gem::Specification.new do |spec|
  spec.name          = 'mobile_text_alerts'
  spec.version       = MobileTextAlerts::VERSION
  spec.authors       = ['John Sanchez']
  spec.email         = ['jr180180@gmail.com']

  spec.summary       = 'Ruby wrapper for the Mobile-Text-Alerts.com API'
  spec.homepage      = 'https://github.com/jr180180'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri']    = spec.homepage + '/mobile-text-alerts'
  spec.metadata['source_code_uri'] = spec.homepage + '/mobile-text-alerts'
  spec.metadata['changelog_uri']   = spec.homepage + '/mobile-text-alerts'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'httparty', '~> 0.18.1'
  spec.add_dependency 'json', '~> 2.3', '>= 2.3.1'

  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'byebug'
end
