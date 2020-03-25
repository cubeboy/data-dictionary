require 'test_helper'

class TermControllerTest < ActionDispatch::IntegrationTest
  url = '/term'
  searchKorName = "좌번"

  test "Term Controller method findByTerms termParam test" do
    setTerm = get url, params: { category: {mainCategoryId: {operator: 'equalOrNull', value: '3'}, middleCategoryId: {operator: 'equalOrNull', value: '1'},
                                subCategoryId: {operator: 'equalOrNull', value: '1'}}, searchVal: searchKorName }
    assert_equal 200, setTerm, "Word Controller method getWords wordParam get url searchKorName Error"
    assert_response :success
    terms = JSON.parse(@response.body)

    terms.each do |term|
      assert (term['name'].include? searchKorName), 'fail'
    end
  end
end
