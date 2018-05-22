class HistoryHash
  attr_reader :store
  private :store

  def initialize(initial_hash = {})
    @store = Hash.new([nil]).merge(initial_hash)
  end

  def get(key, time = store[key].size)
    store[key][safe_time(key, time)]
  end

  def set(key, value)
    store[key].push(value)
    value
  end

  private

  def safe_time(key, time)
    raise ArgumentError, "Time should be positive integer" unless time.is_a?(Integer) && time > 0

    time > store[key].size ? -1 : time - 1
  end
end
