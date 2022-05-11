# frozen_string_literal: true

module Seedr
  module V1
    module Helpers
      module ImageHelper
        extend Grape::API::Helpers
        include Rails.application.routes.url_helpers

        def image_path(obj)
          obj.service_url if obj.attached?
        end

      end
    end
  end
end
