module Allinone
  module Core
    def self.included(base)
      base.extend Allinone::Core::ClassMethods
    end

    def current_site
      RequestStore.store[:current_site]
    end

    def set_current_site
      if Rails.env.test?
        current_site = "" #set a default, passed from the app controller
      else
        current_site = Allinone::SiteSelector.new(request.host).fetch
      end

      site_not_found_handler unless current_site

      RequestStore.store[:current_site] = current_site
    end

    def site_not_found_handler
      render :text => 'Site not Found'
    end
  end
end