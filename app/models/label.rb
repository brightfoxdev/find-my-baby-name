class Label < ApplicationRecord
    has_many :name_label, dependent: :destroy 

end
