require "allinone/version"
require "allinone/core"
require "allinone/brand_selector"
require "request_store"

module Allinone
  module Core
    module ClassMethods
      def act_as_allinone
        prepend_before_filter :set_current_brand
        helper_method :current_brand
      end
    end
  end
end

