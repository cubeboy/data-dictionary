require 'test_helper'

class CommonCodeControllerTest < ActionDispatch::IntegrationTest
  url = '/common_code'

  test "Get All Main Categories" do
    get url, params: {codeTypeId:1, parentId:0}
    mainCategories = JSON.parse(@response.body)
    mainCategories.each do |category|
      assert_equal 1, category['codeTypeId']
      assert_equal 0, category['parentId']
    end
  end

  test "Get Middle Categories By Params" do
    get url, params: {codeTypeId:2, parentId:1}
    middleCategories1 = JSON.parse(@response.body)
    middleCategories1.each do |category|
      assert_equal 2, category['codeTypeId']
      assert_equal 1, category['parentId']
    end

    get url, params: {codeTypeId:2, parentId:2}
    middleCategories2 = JSON.parse(@response.body)
    middleCategories2.each do |category|
      assert_equal 2, category['codeTypeId']
      assert_equal 2, category['parentId']
    end
  end

  test "Get Sub Categories By Params" do
    get url, params: {codeTypeId:3, parentId:5}
    subCategories1 = JSON.parse(@response.body)
    subCategories1.each do |category|
      assert_equal 3, category['codeTypeId']
      assert_equal 5, category['parentId']
    end

    get url, params: {codeTypeId:3, parentId:4}
    subCategories2 = JSON.parse(@response.body)
    subCategories2.each do |category|
      assert_equal 3, category['codeTypeId']
      assert_equal 4, category['parentId']
    end
  end

  test "Get Categories by Wrong Params" do
    get url, params: {codeTypeId:1, parentId: 1}
    mainCategories = JSON.parse(@response.body)
    assert_equal 0, mainCategories.size

    get url, params: {codeTypeId:2, parentId: 0}
    middleCategories = JSON.parse(@response.body)
    assert_equal 0, middleCategories.size

    get url, params: {codeTypeId:3, parentId: 0}
    subCategories = JSON.parse(@response.body)
    assert_equal 0, subCategories.size
  end
end
