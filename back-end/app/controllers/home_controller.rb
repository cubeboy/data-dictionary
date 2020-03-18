class HomeController < ApplicationController
  def index
    commonCodeTypes = []
    commonCodeTypes = CommonCodeType.all

    render json: commonCodeTypes.to_json
  end
end
