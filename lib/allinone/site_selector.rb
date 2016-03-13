module Allinone
  class BrandSelector

    def initialize(request_host)
      @request_host = request_host.downcase
      @@domains_map_last_build_at ||= Time.at(0).to_datetime.utc
      setup_domains_map
    end

    def fetch
      brand_id = @@domains_map[@request_host]
      Brand.where(id: brand_id).first
    end

    private
    def setup_domains_map
      if domains_table_last_updated_at > @@domains_map_last_build_at
        build_domains_map
      end
    end

    def build_domains_map
      @@domains_map = domains_map
      @@domains_map_last_build_at = 1.second.ago.to_datetime.utc
    end

    def domains_map
      Hash[*Domain.select([:name,:brand_id]).all.collect{|p| [p.name.downcase, p.brand_id]}.flatten]
    end

    def domains_table_last_updated_at
      Domain.order('updated_at').last.updated_at
    end

  end
end