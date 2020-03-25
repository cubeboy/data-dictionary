require 'test_helper'

class TermTest < ActiveSupport::TestCase

  test "terms join words id 조회 테스트" do
    param = {id: 1}
    term = Term.findByTerm param

    assert_equal 1, term.size, "not match size"
    assert_equal 2, term[0].words.size, "not match words size"
    assert_equal 2, term[0].termsWords.size, "not match termsWords size"

    term[0].termsWords.each_with_index do |termsWord, index|
      assert_equal index + 1, termsWord[:seq], "not match termsWords seq"
    end
  end

  # test "terms join words Categroy 조회 테스트" do
  #   params = { category: {mainCategoryId: {operator: 'equalOrNull', value: '3'}, middleCategoryId: {operator: 'equalOrNull', value: '1'}, subCategoryId: {operator: 'equalOrNull', value: '1'}}}
  #   terms = Term.findByTerms params

  #   terms.each do |term|
  #     assert '3' == term.mainCategoryId || '' == term.mainCategoryId || nil == term.mainCategoryId, "not match mainCategoryId"
  #     assert '1' == term.middleCategoryId || '' == term.middleCategoryId || nil == term.middleCategoryId, "not match middleCategoryId"
  #     assert '1' == term.subCategoryId || '' == term.subCategoryId || nil == term.subCategoryId, "not match subCategoryId"
  #   end
  # end

  test "class 변수 조합하기" do
    param = {id: 1}
    terms = Term.findByTerm param

    termParams = []

    terms.each do |term|
        term.getTerms
    end

    assert_equal 1, terms.size, "not match size"
    assert_equal "계좌번호", terms[0].name, "not match name"
    assert_equal "AccountNumber", terms[0].engName, "not match engName"
  end

  # test "복합단어 검색 테스트" do
  #   searchKorName = "좌번"
  #   searchEncName = "ountnumb"

  #   params = { category: {mainCategoryId: {operator: 'equalOrNull', value: '3'}, middleCategoryId: {operator: 'equalOrNull', value: '1'},
  #                         subCategoryId: {operator: 'equalOrNull', value: '1'}},
  #               searchVal: searchEncName }
  #   terms = Term.findByTerms params
  #   termParams = []
  #   terms.each do |term|
  #     term.getTerms
  #     if (term.name.upcase.include? params[:searchVal].upcase) || (term.engName.upcase.include? params[:searchVal].upcase)
  #       termParams.push(term.clone)
  #     end
  #   end
  #   assert (termParams[0].name.upcase.include? searchEncName.upcase) ||  (termParams[0].engName.upcase.include? searchEncName.upcase), "not match searchEncName"

  #   params = { category: {mainCategoryId: {operator: 'equalOrNull', value: '3'}, middleCategoryId: {operator: 'equalOrNull', value: '1'},
  #                         subCategoryId: {operator: 'equalOrNull', value: '1'}},
  #               searchVal: searchKorName }
  #   terms = Term.findByTerms params
  #   termParams = []
  #   terms.each do |term|
  #     term.getTerms
  #     if (term.name.upcase.include? params[:searchVal].upcase) || (term.engName.upcase.include? params[:searchVal].upcase)
  #       termParams.push(term.clone)
  #     end
  #   end
  #   assert (termParams[0].name.upcase.include? searchKorName.upcase) ||  (termParams[0].engName.upcase.include? searchKorName.upcase), "not match searchEncName"
  # end

  test "또다른 test" do

  end

end
