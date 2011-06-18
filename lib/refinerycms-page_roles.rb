require 'refinerycms-base'
require 'page_roles/page_extension'
require 'page_roles/role_extension'

module Refinery
  module PageRoles
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end
      
      config.after_initialize do
        ::Refinery::Pages::Tab.register do |tab|
          tab.name = "roles"
          tab.partial = "/admin/pages/tabs/roles"
        end
        ::Refinery::Plugin.register do |plugin|
          plugin.name = "page_roles"
          plugin.hide_from_menu = true
        end
      end

      refinery.after_inclusion do
        Page.send(:include, ::PageRoles::PageExtension)
        Role.send(:include, ::PageRoles::RoleExtension)
      end
    end
  end
end
