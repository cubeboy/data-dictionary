require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  url = "/"

  test "should get index" do
    assert_generates '/',{controller: '/home', action:'index'}
    get url
    assert_response :success

    commonCodeTypes = JSON.parse(@response.body)

    assert_equal 3, commonCodeTypes.size
    assert_equal '대분류', commonCodeTypes[0]['name']
    
    puts(commonCodeTypes)
  end

end
