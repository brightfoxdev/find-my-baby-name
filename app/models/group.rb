class Group < ApplicationRecord
    has many :group_user, dependent: :destroy 

end
