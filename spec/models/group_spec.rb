require 'rails_helper'

RSpec.describe Group, type: :model do
  it { should have_many(:students).dependent(:destroy) }
  it { should belong_to(:teacher) }
  it { should validate_presence_of(:code) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:area) }
end
