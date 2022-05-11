module Seedr
  class Base < Grape::API
    # Contains all the constant that will be used for development
    include Campaigns::V1::Helpers::Constants
    include Campaigns::V1::Helpers::ImageHelper
    include Grape::Kaminari

    PAGINATION_MAX_PER_PAGE = 300
    PAGINATION_DEFAULT_PER_PAGE = 50

    # Helpers to send success or failure message to frontend
    helpers Campaigns::V1::Helpers::ResponseHelper

    helpers Campaigns::V1::Helpers::ImageHelper


    version 'v1', using: :path
    format :json
    prefix :api
    formatter :json, Grape::Formatter::Json

    # pagination
    before do
      # grape-kaminari will always return a page header of the given per_page param
      # and not the really used (and maybe enforced) value
      if params[:per_page] && params[:per_page].to_i > PAGINATION_MAX_PER_PAGE
        params[:per_page] = PAGINATION_MAX_PER_PAGE
      end
    end

    @error = []
    mount Seedr::V1::Campaigns
    mount Seedr::V1::Investments
    HTTP_ERROR = [400, 401, 403, 404, 422, 500, 503, 999].freeze
  end
end