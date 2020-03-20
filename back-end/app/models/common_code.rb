class CommonCode < ApplicationRecord
    belongs_to :commonCodeType

    def CommonCode.getCategoriesByParams(params)
        categories = CommonCode.where('"codeTypeId"= :codeTypeId and "parentId" = :parentId',
            codeTypeId: params[:codeTypeId], parentId: params[:parentId])
            .order('name asc')
    end

end
