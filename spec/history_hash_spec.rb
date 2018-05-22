require "history_hash"

describe HistoryHash do
  describe "#get" do
    subject(:store) { HistoryHash.new age: [nil, 27, 28, 29] }

    it "returns nil if the key is not present" do
      expect(store.get(:non_existing)).to be_nil
    end

    it "returns the latest value of the key if the time is not specified" do
      expect(store.get(:age)).to eq 29
    end

    it "returns the value at particular time if the time is present" do
      expect(store.get(:age, 3)).to eq 28
    end

    it "always returns nil at time 1" do
      expect(store.get(:age, 1)).to be_nil
    end

    it "returns the latest value if the specified time is bigger than number of assignments" do
      expect(store.get(:age, 42)).to eq 29
    end

    it "raises an ArgumentError for every negative time" do
      expect { store.get(:age, -2) }.to raise_error ArgumentError
    end

    it "raises an ArgumentError if the time is not a number" do
      expect { store.get(:age, "old") }.to raise_error ArgumentError
    end
  end

  describe "#set" do
    subject(:store) { HistoryHash.new age: [nil, 27, 28, 29] }

    it "allows to set values for new keys" do
      store.set(:amount, 1000)
      expect(store.get(:amount)).to eq 1000
    end

    it "allows to set new value for existing keys" do
      store.set(:age, 30)
      expect(store.get(:age)).to eq 30
    end

    it "returns newly set value" do
      expect(store.set(:age, 31)).to eq 31
    end
  end
end
