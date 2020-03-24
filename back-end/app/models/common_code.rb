class CommonCode < ApplicationRecord
    validates :name, :code_type_id, :eng_name, :parent_id, presence: true, allow_blink: false, allow_nil: false
    belongs_to :common_code_type

    def CommonCode.getCategoriesByParam(params)
        categories = CommonCode.where('"parentId" = :parentId',parentId: params[:id]).order('name asc')
    end

end
