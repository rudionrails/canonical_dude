module CanonicalDude

  def self.setup_action_controller( base )
    base.class_eval do
      include CanonicalDude::ControllerMethods
    end
  end

  def self.setup_action_view( base )
    base.class_eval do
      include CanonicalDude::ViewMethods
    end
  end

end
if defined?(Rails::Railtie)
  require 'canonical_dude/railtie'
elsif defined?(Rails::Initializer)
  raise "canonical_dude is not compatible with Rails 2.3 or older"
end

