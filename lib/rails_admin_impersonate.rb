require "rails_admin_impersonate/version"

module RailsAdmin
  module Config
    module Actions
      class Impersonate < RailsAdmin::Config::Actions::Base
        register_instance_option :visible? do
          ('Admin' != bindings[:abstract_model].model_name) &&
            authorized? && bindings[:object].respond_to?(:devise_modules)
        end

        register_instance_option :member? do
          true
        end

        register_instance_option :pjax? do
          false
        end

        register_instance_option :http_methods do
          [:post]
        end

        register_instance_option :link_icon do
          'icon-home'
        end

        register_instance_option :controller do
          Proc.new do
            sign_in @object
            redirect_to @object.authenticated_url
          end
        end

        RailsAdmin::Config::Actions.register(self)
      end
      class Browserstack < RailsAdmin::Config::Actions::Base
        register_instance_option :visible? do
          ('Admin' != bindings[:abstract_model].model_name) &&
            authorized? && bindings[:object].respond_to?(:devise_modules)
        end

        register_instance_option :member? do
          true
        end

        register_instance_option :pjax? do
          false
        end

        register_instance_option :http_methods do
          [:post]
        end

        register_instance_option :link_icon do
          'icon-globe'
        end

        register_instance_option :controller do
          Proc.new do
            redirect_to @object.browserstack_url
          end
        end

        RailsAdmin::Config::Actions.register(self)
      end
    end
  end
end

I18n.load_path += Dir.glob(File.expand_path("../../config/locales/*.{rb,yml}", __FILE__))
