class Group < ApplicationRecord
  belongs_to :teacher
  has_many :students, dependent: :destroy
  validates_presence_of :code, :name, :area

end
