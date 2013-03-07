require 'rails/railtie'

module CanonicalDude
  class Railtie < Rails::Railtie

    initializer "canonical_dude" do |app|
      ActiveSupport.on_load :action_controller do
        require 'canonical_dude/action_controller_methods'

        ::ActionController::Base.send :include, CanonicalDude::ActionControllerMethods
      end

      ActiveSupport.on_load :action_view do
        require 'canonical_dude/action_view_methods'

        ActionView::Base.send :include, CanonicalDude::ActionViewMethods
      end
    end

  end
end

