require "allinone/version"
require "allinone/core"
require "allinone/site_selector"
require "request_store"

module Allinone
  module Core
    module ClassMethods
      def act_as_allinone
        prepend_before_filter :set_current_site
        helper_method :current_site
      end
    end
  end
end

