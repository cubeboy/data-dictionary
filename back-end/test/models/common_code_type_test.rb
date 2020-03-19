require 'test_helper'

class CommonCodeTypeTest < ActiveSupport::TestCase
  test "Get All Code Types" do
    codeTypes = CommonCodeType.getAllTypes

    assert_equal 3, codeTypes.size

    print("codetype' size is: ", codeTypes.size)
  end
end
