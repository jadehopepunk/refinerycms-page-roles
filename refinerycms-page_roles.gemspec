Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-page_roles'
  s.version           = '0.1'
  s.summary           = 'Page Roles engine for Refinery CMS'
  s.description       = 'Adds to the refinerycms-pages engine for RefineryCMS. Provides role based access to pages.'
  s.require_paths     = %w(lib)
  s.files             = Dir['{app,lib,config,db,spec}/**/*', 'readme.*', 'LICENCE']
  
  s.authors  = ['Craig Ambrose']
  s.email    = 'craig@craigambrose.com'
  s.homepage = 'https://github.com/craigambrose/refinerycms-page-roles'
    
  s.add_dependency('refinerycms-pages', '~> 1.0.8')
end
