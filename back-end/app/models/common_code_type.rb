class CommonCodeType < ApplicationRecord
    validates :name, :eng_name, presence: true, allow_blink: false, allow_nil: false
    # has_many :commonCodes, foreign_key => "codeTypeId"

    # def CommonCodeType.getAllCodeTypes
    #     codeTypes = CommonCodeType.select('id','name','engName').joins(:commonCodes)
    # end

    has_many :commoncodes

    def CommonCodeType.getAllCodeTypes
        codeTypes = CommonCodeType.select('id','name','engName')
    end

end
