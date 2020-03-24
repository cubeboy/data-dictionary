class CommonCodeType < ApplicationRecord
    validates :name, :eng_name, presence: true, allow_blink: false, allow_nil: false
    has_many :commoncodes

end
