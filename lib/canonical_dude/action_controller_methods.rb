module CanonicalDude
  module ActionControllerMethods

    def canonical_url( url_for_options = {} )
      self.instance_variable_set( "@_canonical_url_for_options", url_for_options )
    end

  end
end
