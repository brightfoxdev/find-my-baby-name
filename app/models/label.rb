class Label < ApplicationRecord
    has many :name_label, dependent: :destroy 

end
