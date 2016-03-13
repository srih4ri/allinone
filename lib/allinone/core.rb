module Allinone
  module Core
    def self.included(base)
      base.extend Allinone::Core::ClassMethods
    end

    def current_brand
      RequestStore.store[:current_brand]
    end

    def set_current_brand
      if Rails.env.test?
        current_brand = "" #set a default, passed from the app controller
      else
        current_brand = Allinone::BrandSelector.new(request.host).fetch
      end

      brand_not_found_handler unless current_brand

      RequestStore.store[:current_brand] = current_brand
    end

    def brand_not_found_handler
      render :text => 'Brand not Found'
    end
  end
end