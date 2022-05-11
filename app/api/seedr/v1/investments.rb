# frozen_string_literal: true

module Seedr
  module V1
    class Investments < Campaigns::Base
      resource :investments do
          desc "Create a new investment"
          params do
            requires :investment, type: Hash do
              requires :amount, type: String
              requires :campaign_id, type: Integer
            end
          end

          post do
            investment = Investment.new(params[:investment])
            investment.save!
            present investment, with: Campaigns::V1::Entities::Investments
          rescue StandardError => error
            Rails.logger.error "\n#{__FILE__}\nUnable to create investment due to: #{error.message}"
            error!(respond_with_json("Unable to create investment due to: #{error.message}.", HTTP_CODE[:UNPROCESSABLE_ENTITY]),
                   HTTP_CODE[:UNPROCESSABLE_ENTITY])
          end
        end
    end
  end
end



