class HistoryHash
  attr_reader :store
  private :store

  def initialize(initial_hash = {})
    @store = Hash.new([nil]).merge(initial_hash)
  end

  def get(key, time = 0)
    store[key][time - 1]
  end

  def set(key, value)
    store[key].push(value)
    value
  end
end
