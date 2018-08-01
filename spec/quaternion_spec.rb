RSpec.describe Quaternion do
  it "has a version number" do
    expect(Quaternion::VERSION).not_to be nil
  end

  it "the real quaternion 1 is the identity element" do
    q = Quaternion.new(1,0,0,0)
    expect(q.identity_element?).to be true
  end
  it "the real quaternion commute with all other quaternions" do
    q = Quaternion.new(1,2,3,4)
    a = Quaternion.new(4,0,0,0)
    expect(a.real?).to be true
    expect(a * q).to eq (q * a)
  end
end
