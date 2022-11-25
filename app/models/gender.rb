class Gender < ApplicationRecord
    has_many :name_gender, dependent: :destroy 

end
