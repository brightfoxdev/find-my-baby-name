class Origin < ApplicationRecord
    has many :name_origin, dependent: :destroy 

end
