module CanonicalDude::HelperMethods

  # tag to include within your HTML header, e.g.:
  #   <%= canonical_link_tag %>
  def canonical_link_tag( url = nil )
    url ||= @canonical_url || request.url

    tag( :link, :rel => 'canonical', :href => url )
  end

  # returns true if canonical_url has been explicitly set
  def canonical_url?
    !!@canonical_url
  end

end
