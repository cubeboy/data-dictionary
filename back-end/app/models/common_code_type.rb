class CommonCodeType < ApplicationRecord
    
    # has_many :commonCodes, foreign_key => "codeTypeId"

    # def CommonCodeType.getAllCodeTypes
    #     codeTypes = CommonCodeType.select('id','name','engName').joins(:commonCodes)
    # end
    
    has_many :commoncodes

    def CommonCodeType.getAllCodeTypes
        codeTypes = CommonCodeType.select('id','name','engName')
    end

end
