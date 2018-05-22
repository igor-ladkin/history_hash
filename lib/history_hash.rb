class HistoryHash
  attr_reader :store
  private :store

  def initialize(initial_hash = {})
    @store = initial_hash
  end

  def get(key, time = 0)
    if store.key?(key)
      store[key][time - 1]
    else
      nil
    end
  end
end
