class CommonCode < ApplicationRecord
    validates :name, :code_type_id, :eng_name, :parent_id, presence: true, allow_blink: false, allow_nil: false
    belongs_to :common_code_type

    def CommonCode.getCategoriesByParams(params)
        categories = CommonCode.where('"codeTypeId"= :codeTypeId and "parentId" = :parentId',
            codeTypeId: params[:codeTypeId], parentId: params[:parentId])
            .order('name asc')
    end

end
