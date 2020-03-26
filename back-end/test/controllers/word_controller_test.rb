require 'test_helper'

class WordControllerTest < ActionDispatch::IntegrationTest
  url = '/word'
  searchKorName = "계좌"
  searchEncName = "thdr"
  searchId = 3

  test "Word Controller Search all test" do
    assert_generates url, {controller: url, action: 'index'}
    param = {search: ''}
    getWord = get url, params: {wordParam: param}
    assert_equal 200, getWord, "Word Controller Search all get url Error"
    assert_response :success
    words = JSON.parse(@response.body)
    assert 0 < words.size, "Word Controller Search all no data"
  end

  test "Word Controller method getWords wordParam test" do
    assert_generates url, {controller: url, action: 'index'}
    param = {search: searchKorName}
    getWord = get url, params: {wordParam: param}
    assert_equal 200, getWord, "Word Controller method getWords wordParam get url searchKorName Error"
    assert_response :success
    words = JSON.parse(@response.body)
    words.each do |word|
      assert (word['name'].upcase.include? searchKorName.upcase) || (word['engName'].upcase.include? searchKorName.upcase), 'Word Controller method getWords wordParam - searchKorName Fail'
    end

    param = {search: searchEncName}
    getWord = get url, params: {wordParam: param}
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

  test "Word Controller create test" do
    assert_difference('Word.count') do
      param = { name: searchKorName, engName: searchEncName, shortEng: 'Ins', entity: 'T_Ins', column: 'ins', javascript: 'ins',
        wordClass: 'Ins', wordClassMember: 'ins', paramValue: 'ins' }
      post url, params: { wordParam: param }
    end
    word = Word.last
    assert_equal searchKorName, word.name, 'Word Controller update - name Fail'
    assert_equal searchEncName, word.engName, 'Word Controller update - engName Fail'
    # assert_redirected_to word_path(Word.last)
  end

  test "Word Controller update test" do
    param = { name: searchKorName, engName: searchEncName }
    patch url + "/#{searchId}", params: { wordParam: param }
    word = Word.find(searchId)
    assert_equal searchKorName, word.name, 'Word Controller update - name Fail'
    assert_equal searchEncName, word.engName, 'Word Controller update - engName Fail'
    # assert_redirected_to article_path(word)
  end

  test "Word Controller destroy test" do
    assert_difference('Word.count', -1) do
      delete url + "/#{searchId}"
    end
    assert_equal false, Word.exists?(searchId), 'Word Controller destroy - destroy Fail'
    # assert_redirected_to word_path
  end

end
