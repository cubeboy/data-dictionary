require 'test_helper'

class CommonCodeTest < ActiveSupport::TestCase

  test "Get Categories by Params" do

    params= {codeTypeId:1, parentId:0}
    mainCategories1 = CommonCode.getCategoriesByParams(params)

    mainCategories1.each do |category|
      assert_equal 1, category[:codeTypeId]
      assert_equal 0, category[:parentId]
    end

    params= {codeTypeId:2, parentId:1}
    middleCategories = CommonCode.getCategoriesByParams(params)

    middleCategories.each do |category|
      assert_equal 2, category[:codeTypeId]
      assert_equal 1, category[:parentId]
    end
  end

end
