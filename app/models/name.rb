class Name < ApplicationRecord
    has many :name_gender, dependent: :destroy 
    has many :name_label, dependent: :destroy 
    has many :name_origin, dependent: :destroy 

end
