require 'spec_helper'


describe User do
  it "exists" do
    expect(User).to be_a(Class)
  end

  describe "initialize" do
    it "initializes with name and id" do
      c = User.new("Caresa", 0)
      expect(c).to be_a(User)
      expect(c.id).to eq(0)
      expect(t.name).to eq("Caresa")
    end
  end
end
