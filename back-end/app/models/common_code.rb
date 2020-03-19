class CommonCode < ApplicationRecord

    def CommonCode.getMainCategories
        mainCategory = CommonCode.select('id','codeTypeId','name','engName','engName')
        .where('"codeTypeId"= 1')
    end

    def CommonCode.getMiddleCategories(param)
        middleCategory = CommonCode.select('id','codeTypeId','name','engName','engName')
                                .where('"codeTypeId"= 2 and "parentId"= :id', id: param[:mainId]).order('name asc')
    end

    def CommonCode.getSubCategories(param)
        subCategory = CommonCode.where('"codeTypeId"= 3 and "parentId"= :id', id: param[:middleId]).order('name asc')
    end
end
