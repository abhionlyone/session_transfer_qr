# lib/generators/session_transfer_qr/install_generator.rb
require 'rails/generators'

module SessionTransferQR
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      def copy_controller
        template "session_transfer_controller.rb", "app/controllers/session_transfer_controller.rb"
      end

      def add_routes
        route "get 'session_transfer/new', to: 'session_transfer#new'"
        route "post 'session_transfer/create', to: 'session_transfer#create'"
      end
    end
  end
end