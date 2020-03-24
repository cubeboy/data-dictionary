class Term < ApplicationRecord
    has_many :termsWords, -> { order(:seq) }, :foreign_key => 'termsId'
    has_many :words, :through => :termsWords

    def Term.findByTerm param
        term = Term.select('terms.*, \'\' as "name", \'\' as "engName", \'\' as "shortEng", \'\' as "entity", \'\' as "column",
            \'\' as "javascript", \'\' as "wordClass", \'\' as "wordClassMember", \'\' as "paramValue"').
          where('terms.id = :id', id: param[:id])
    end

    def Term.findByTerms params
        whereColumn = Term.createWhereColumn(params[:category])
        whereValues = Term.createWhereValue(params[:category])
        terms = Term.select('terms.*, \'\' as "name", \'\' as "engName", \'\' as "shortEng", \'\' as "entity", \'\' as "column",
            \'\' as "javascript", \'\' as "wordClass", \'\' as "wordClassMember", \'\' as "paramValue"').
          where(whereColumn, whereValues)
    end

    def Term.createWhereColumn params
        whereStrings = []
        params.each do |column, val|
          if val != nil && val != ""
            whereStrings.push Term.public_send(val[:operator].to_sym, column)
          end
        end
        whereStrings.join(' and ')
    end

    def Term.createWhereValue params
        vals = {}
        params.each do |column, val|
          if val[:value] != nil && val[:value] != ""
            vals[column.to_sym] = val[:value]
          end
        end
        return vals
    end

    def Term.equalOrNull column
        "(\"#{column}\" = :#{column} or \"#{column}\" isnull)"
    end

    def getTerms
      # self.words.each do |word|
      self.words.each_with_index do |word, index|
        if index == 0
            self[:name] = word.name
            self[:engName] = word.engName
            self[:shortEng] = word.shortEng
            self[:entity] = word.entity
            self[:column] = word.column
            self[:javascript] = word.javascript
            self[:wordClass] = word.wordClass
            self[:wordClassMember] = word.wordClassMember
            self[:paramValue] = word.paramValue
        else
            self[:name] += word.name
            self[:engName] += word.engName
            self[:shortEng] += word.shortEng
            self[:entity] += word.entity
            self[:column] += word.column
            self[:javascript] += word.javascript
            self[:wordClass] += word.wordClass
            self[:wordClassMember] += word.wordClassMember
            self[:paramValue] += word.paramValue
        end
      end

    #   return @termsEngWord
    end

end

