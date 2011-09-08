Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-page_roles'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Page Roles engine for Refinery CMS'
  s.date              = '2011-06-14'
  s.summary           = 'Page Roles engine for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir['lib/**/*', 'config/**/*', 'app/**/*']
  
  s.add_dependency('cancan', '>= 1.6.5')
end
