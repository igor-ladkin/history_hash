require "history_hash"

describe HistoryHash do
  describe "#get" do
    subject(:store) { HistoryHash.new age: [27, 28, 29] }

    it "returns nil if the key is not present" do
      expect(store.get(:non_existing)).to be_nil
    end

    it "returns the latest value of the key if the time is not specified" do
      expect(store.get(:age)).to eq 29
    end

    it "returns the value at particular time if the time is present" do
      expect(store.get(:age, 2)).to eq 28
    end
  end
end
