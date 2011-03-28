require 'canonical_dude'

if defined?( Rails )
  ActionController::Base.send :include, CanonicalDude::ControllerMethods
  ActionView::Base.send :include, CanonicalDude::HelperMethods
end
