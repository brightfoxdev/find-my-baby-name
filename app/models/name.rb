class Name < ApplicationRecord
    has_many :name_label, dependent: :destroy 
    has_many :name_origin, dependent: :destroy 

end
