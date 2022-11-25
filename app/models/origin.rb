class Origin < ApplicationRecord
    has_many :name_origin, dependent: :destroy 

end
