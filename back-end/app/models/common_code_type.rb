class CommonCodeType < ApplicationRecord
    has_many :commoncodes

    def CommonCodeType.getAllCodeTypes
        codeTypes = CommonCodeType.select('id','name','engName')
    end

end
