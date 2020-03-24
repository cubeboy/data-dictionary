class Word < ApplicationRecord
    validates :name, :engName, :shortEng, :entity, :column, :javascript, :wordClass, :wordClassMember, :paramValue , presence:true, allow_blank: false, allow_nil: false

    has_many :termsWords, :foreign_key => 'wordId'
    has_many :terms, :through => :termsWords

    def Word.getWords wordParam
        likeWord = "%#{wordParam[:search]}%"
        word = Word.where('(name ilike :search or "engName" ilike :search)', search: likeWord)
    end

end
