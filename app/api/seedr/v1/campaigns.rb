# frozen_string_literal: true

module Seedr
  module V1
    class Campaigns < Campaigns::Base
      resource :campaigns do
        desc 'Fetch seedr.'
        params do
          desc "Get all the campaign list even with the filter of sector, country"
          params do
            use :pagination, per_page: 50
          end
          get '/list' do
            campaign_list = Campaign.all
            campaign_list = campaign_list.where(sector: params[:sector]) if params[:sector].present?
            campaign_list = campaign_list.where(country: params[:country]) if params[:country].present?
            response = Campaign::V1::Entities::Campaigns.represent(
              paginate(Kaminari.paginate_array(campaign_list.order(id: :desc))),
              )
            success_response_with_json('campaign list successfully fetched', HTTP_CODE[:OK], response)
          rescue StandardError => error
            Rails.logger.info " campaign list fetch error due to #{error.message}"
            error!(failure_response_with_json('Failed to load campaign list',
                                              HTTP_CODE[:UNPROCESSABLE_ENTITY], {}), HTTP_CODE[:OK])
          end
        end
      end
    end
  end
end



