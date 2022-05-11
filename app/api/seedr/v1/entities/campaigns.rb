# frozen_string_literal: true

module Seedr
  module V1
    module Entities
      class Campaigns < Grape::Entity
        expose :name
        expose :image
        expose :amount
        expose :sector
        expose :country

        def image
          image_path(object&.image)
        end

      end
    end
  end
end
