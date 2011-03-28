module CanonicalDude::ControllerMethods

  def canonical_url( url_for_options = {} )
    @canonical_url = case
      when Hash then url_for( url_for_options )
      when String then url_for_options
      else # could be an AR instance, so let's try some custom methods
        # will turn a User instance into 'user'
        canonical_method_name = url_for_options.class.name.downcase.gsub( '::', '_' )

        custom_canonical_method_name = [
          "canonical_#{canonical_method_name}_url",
          "canonical_#{canonical_method_name}_path",
          "canonical_url_for"
        ].find { |m| respond_to? m }
        
        return url_for( url_for_options ) unless custom_canonical_method_name
        send( custom_canonical_method_name, url_for_options )
      end
    end
  end

end
