require 'test_helper'

class CommonCodeTest < ActiveSupport::TestCase

  test "Get All Main Category" do
    mainCategory = CommonCode.getMainCategories

    assert_equal 3, mainCategory.size
    assert_equal '금융', mainCategory[0].name
  end

  test "Get Middle Category By Param" do
    param = {mainId: 1}
    middleCategory = CommonCode.getMiddleCategories(param)

    assert_equal 3, middleCategory.size
  end

  test "Get Sub Category By Param" do
    param = {middleId: 4}
    subCategory = CommonCode.getSubCategories(param)

    assert_equal 2, subCategory.size
  end

end
