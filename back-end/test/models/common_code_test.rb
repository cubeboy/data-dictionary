require 'test_helper'

class CommonCodeTest < ActiveSupport::TestCase
  test "Get Categories by Param" do
    param = {id: 0 }
    mainCategories = CommonCode.getCategoriesByParam(param)

    mainCategories.each do | category |
      assert_equal 1, category[:codeTypeId]
      assert_equal 0, category[:parentId]
    end

    param = {id:1}
    middleCategories = CommonCode.getCategoriesByParam(param)

    middleCategories.each do |category|
      assert_equal 2, category[:codeTypeId]
      assert_equal 1, category[:parentId]
    end

    param = {id:4}
    subCategories = CommonCode.getCategoriesByParam(param)

    subCategories.each do |category|
      assert_equal 3, category[:codeTypeId]
      assert_equal 4, category[:parentId]
    end

  end

end
