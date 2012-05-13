module WhitelabelRoutes
  module LabelSubdomain
    def self.matches?(request)
      Whitelabel.label_for(request.subdomain)
    end
  end

  module NoSubdomain
    def self.matches?(request)
      request.subdomain.blank? || request.subdomain == "www"
    end
  end
end
