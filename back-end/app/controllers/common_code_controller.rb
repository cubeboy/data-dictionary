class CommonCodeController < ApplicationController

    # def index
    #     categories = []
    #     categories = CommonCode.getCategoriesByParams(params)

    #     render json: categories.to_json
    # end

    def index
        categories = []

        categories = CommonCode.getCategoriesByParams(params)
        render json: categories.to_json
    end

    def show
        categories = []

        categories = CommonCode.getCategoriesByParams(params)
        render json: categories.to_json
    end
end
