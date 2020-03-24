class TermsWord < ApplicationRecord
    belongs_to :term, :foreign_key => 'termsId'
    belongs_to :word, :foreign_key => 'wordId'

end
