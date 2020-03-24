class CommonCodeController < ApplicationController

    def index
        categories = []

        categories = CommonCode.getCategoriesByParam(params)
        render json: categories.to_json
    end
end
