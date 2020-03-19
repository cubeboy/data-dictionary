class CommonCodeType < ApplicationRecord
    has_many :commoncodes

    def CommonCodeType.getAllTypes
        codeTypes = CommonCodeType.all
    end

end
