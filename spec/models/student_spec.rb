require 'rails_helper'

RSpec.describe Student, type: :model do
  it { should belong_to(:group) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:age) }
end
