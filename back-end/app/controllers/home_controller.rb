class HomeController < ApplicationController
  def index
    typesAndMainCategories = []
    typesAndMainCategories.push(CommonCodeType.getAllCodeTypes)
    typesAndMainCategories.push(CommonCode.getMainCategories)
    
    # mainCategories = CommonCode.getMainCategories

    # typesAndMainCategories = commonCodeTypes
    # typesAndMainCategories.push(mainCategories)

    render json: typesAndMainCategories.to_json
  end

  def show
  end
end
