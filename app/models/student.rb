class Student < ApplicationRecord
  belongs_to :group
  validates_presence_of :name, :age
end
