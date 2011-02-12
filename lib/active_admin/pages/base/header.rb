module ActiveAdmin
  module Pages
    class Base

      # Renderer for the header of the application. Includes the page
      # title, global navigation and utility navigation.
      class Header < ::ActiveAdmin::Renderer

        def to_html
          title + global_navigation + utility_navigation
        end

        protected

        def title
          content_tag 'h1', ActiveAdmin.site_title, :id => 'site_title'
        end

        # Renders the global navigation returned by 
        # ActiveAdmin::ResourceController#current_menu
        #
        # It uses the ActiveAdmin.tabs_renderer option
        def global_navigation
          render view_factory.global_navigation, current_menu
        end

        def utility_navigation
          content_tag 'p', :id => "utility_nav" do
            link_to "Logout", "/#{ActiveAdmin.default_namespace}/logout"
          end
        end
      end

    end
  end
end