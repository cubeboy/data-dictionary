require 'test_helper'

class WordTest < ActiveSupport::TestCase
  searchKorName = "계좌"
  searchEncName = "thdr"
  searchId = 2

  def getTestWord
    return {"id"=> 9999999, "name"=>"보험", "engName"=>"Insurance", "shortEng"=>"Ins", "entity"=>"T_Ins", "column"=>"ins",
      "javascript"=>"ins", "wordClass"=>"Ins", "wordClassMember"=>"ins", "paramValue"=>"ins"}
  end

  test "save blank, nil vaildates" do
    word = Word.new(getTestWord)
    word[:name] = nil
    assert !word.save, 'Save Validates word name Fail'
    assert_equal 1, word.errors.size , 'Validates Fail - name'

    word = Word.new(getTestWord)
    word[:engName] = nil
    assert !word.save, 'Save Validates word engName Fail'
    assert_equal 1, word.errors.size , 'Validates Fail - engName'

    word = Word.new(getTestWord)
    word[:shortEng] = nil
    assert !word.save, 'Save Validates word shortEng Fail'
    assert_equal 1, word.errors.size , 'Validates Fail - shortEng'

    word = Word.new(getTestWord)
    word[:entity] = nil
    assert !word.save, 'Save Validates word entity Fail'
    assert_equal 1, word.errors.size , 'Validates Fail - entity'

    word = Word.new(getTestWord)
    word[:column] = nil
    assert !word.save, 'Save Validates word column Fail'
    assert_equal 1, word.errors.size , 'Validates Fail - column'

    word = Word.new(getTestWord)
    word[:javascript] = nil
    assert !word.save, 'Save Validates word javascript Fail'
    assert_equal 1, word.errors.size , 'Validates Fail - javascript'

    word = Word.new(getTestWord)
    word[:wordClass] = nil
    assert !word.save, 'Save Validates wordClass javascript Fail'
    assert_equal 1, word.errors.size , 'Validates Fail - wordClass'

    word = Word.new(getTestWord)
    word[:wordClassMember] = nil
    assert !word.save, 'Save Validates wordClassMember javascript Fail'
    assert_equal 1, word.errors.size , 'Validates Fail - wordClassMember'

    word = Word.new(getTestWord)
    word[:paramValue] = nil
    assert !word.save, 'Save Validates paramValue javascript Fail'
    assert_equal 1, word.errors.size , 'Validates Fail - paramValue'
  end

  test "Save Word Data" do
    word = Word.new(getTestWord)
    assert word.save, 'Save Fail'
    assert_equal 0, word.errors.size, 'Save word Fail'
    wordFind = Word.find(9999999)
    assert_equal wordFind.name, word.name, 'Save word Fail - Word name error'
    assert_equal wordFind.engName, word.engName, 'Save word Fail - Word engName error'
    assert_equal wordFind.shortEng, word.shortEng, 'Save word Fail - Word shortEng error'
    assert_equal wordFind.entity, word.entity, 'Save word Fail - Word entity error'
    assert_equal wordFind.column, word.column, 'Save word Fail - Word column error'
    assert_equal wordFind.javascript, word.javascript, 'Save word Fail - Word javascript error'
    assert_equal wordFind.wordClass, word.wordClass, 'Save word Fail - Word wordClass error'
    assert_equal wordFind.wordClassMember, word.wordClassMember, 'Save word Fail - Word wordClassMember error'
    assert_equal wordFind.paramValue, word.paramValue, 'Save word Fail - Word paramValue error'
  end

  test "Update Word Data" do
    wordUpdateData = Word.find(searchId)
    assert !(searchKorName == wordUpdateData.name), 'Update Word - 업데이트전 name 값이 틀림'
    assert !(searchEncName == wordUpdateData.engName), 'Update Word - 업데이트전 engName 값이 틀림'

    word_param = {"name"=>searchKorName, "engName"=>searchEncName}
    assert wordUpdateData.update(word_param), 'Update Fail'
    assert_equal 0, wordUpdateData.errors.size, 'Update Word Fail'

    word = Word.find(searchId)
    assert_equal searchKorName, word.name, 'Update Word - Word name Fail'
    assert_equal searchEncName, word.engName, 'Update Word - Word engName Fail'
  end

  test "Word destroy Test" do
    word = Word.find(searchId)
    word.destroy
    assert_equal false, Word.exists?(searchId), 'Word destroy - destroy Fail'
  end

  test "Search Word all" do
    words = Word.all
    assert words.size > 0, 'Search Word all - data nil'
    assert_equal Word.all.size, words.size, 'Search Word all - size Fail'
  end

  test "Search Word method getWords wordParam" do
    wordParam = {search: searchKorName}
    words = Word.getWords wordParam
    words.each do |word|
      assert (word.name.upcase.include? searchKorName.upcase) || (word.engName.upcase.include? searchKorName.upcase), 'Search Word method getWords wordParam - searchKorName Fail'
    end

    wordParam = {search: searchEncName}
    words = Word.getWords wordParam
    words.each do |word|
      assert (word.name.upcase.include? searchEncName.upcase) || (word.engName.upcase.include? searchEncName.upcase), 'Search Word method getWords wordParam - searchEncName Fail'
    end
  end

  test "Search find id" do
    word = Word.find(searchId)
    assert_equal searchId, word[:id], 'Search find id - id Fail'
  end

end
