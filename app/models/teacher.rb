class Teacher < ApplicationRecord
    has_many :groups, dependent: :destroy
    validates_presence_of :name, :email, :password
end
