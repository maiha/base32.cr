require "./spec_helper"

describe Base32 do
  it "provides encode, decode" do
    Base32.encode(123456789012).should eq("3JZ9J6GM")
    Base32.decode("3JZ9J6GM").should eq(123456789012)
  end

  it "accepts zero" do
    Base32.encode(0).should eq("0")
    Base32.decode("0").should eq(0)
  end

  it "raises when invalid chars found" do
    expect_raises(ArgumentError) do
      Base32.decode("!")
    end
  end

  it "ensures reversibility" do
    random = Random.new
    10000.times do
      v = random.rand(0_i64..Int64::MAX)
      e = Base32.encode(v)
      d = Base32.decode(e)
      d.should eq(v)
    end
  end
end
