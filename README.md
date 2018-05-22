# HistoryHash

In-memory key-value store with the history API.

## Setup

```
bin/setup # to setup dependencies
```
```
bin/console # console prompt with API reference
```

## Usage

```rb
store = HistoryHash.new
store.get(:foo) # => nil
store.set(:foo, 42) # => 42
store.set(:foo, 24) # => 24
store.get(:foo) # => 24
store.get(:foo, 2) # => 42
store.get(:foo, 42) # => 24
```
