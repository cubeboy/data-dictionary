require 'test_helper'

class WordControllerTest < ActionDispatch::IntegrationTest
  url = '/word'
  searchKorName = "계좌"
  searchEncName = "thdr"
  searchId = 3

  test "Word Controller Search all test" do
    assert_generates url, {controller: url, action: 'index'}
    getWord = get url
    assert_equal 200, getWord, "Word Controller Search all get url Error"
    assert_response :success
    words = JSON.parse(@response.body)
    assert 0 < words.size, "Word Controller Search all no data"
  end

  test "Word Controller method getWords wordParam test" do
    getWord = get url, params: {search: searchKorName}
    assert_equal 200, getWord, "Word Controller method getWords wordParam get url searchKorName Error"
    assert_response :success
    words = JSON.parse(@response.body)
    words.each do |word|
      assert (word['name'].upcase.include? searchKorName.upcase) || (word['engName'].upcase.include? searchKorName.upcase), 'Word Controller method getWords wordParam - searchKorName Fail'
    end

    getWord = get url, params: {search: searchEncName}
    assert_equal 200, getWord, "Word Controller method getWords wordParam url searchEncName Error"
    assert_response :success
    words = JSON.parse(@response.body)
    words.each do |word|
      assert (word['name'].upcase.include? searchEncName.upcase) || (word['engName'].upcase.include? searchEncName.upcase), 'Word Controller method getWords wordParam - searchEncName Fail'
    end
  end

  test "Word Controller Search find id test" do
    getWord = get url + "/#{searchId}"
    assert_equal 200, getWord, "Word Controller Search find id - get url Error"
    assert_response :success
    word = JSON.parse(@response.body)
    assert_equal searchId, word["id"], "Word Controller Search find id - id Fail"
  end

end
