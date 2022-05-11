# frozen_string_literal: true

module Seedr
  module V1
    module Entities
      class Investments < Grape::Entity
        expose :campaign_name
        expose :image
        expose :investment_amount
        expose :sector
        expose :country

        def campaign_name
          object.campaign.name
        end

        def sector
          object.sector
        end

        def country
          object.country
        end

        def investment_amount
          object.amount
        end

        def image
          image_path(object.campaign&.image)
        end
      end
    end
  end
end
