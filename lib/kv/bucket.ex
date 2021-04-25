defmodule KV.Bucket do
  @doc """
  Starts a new bucket
  """
  def start_link do
    Agent.start_link(fn -> Map.new() end)
  end

  @doc """
  Gets a value by `key` in a `bucket`
  """
  def get(bucket, key) do
    Agent.get(bucket, &Map.get(&1, key))
  end

  @doc """
  Puts the `value` for a `key` inside a `bucket`
  """
  def put(bucket, key, value) do
    Agent.update(bucket, &Map.put(&1, key, value))
  end

  @doc """
  Deletes `key` from `bucket`. Returns the current `key` value if it exists
  """
  def delete(bucket, key) do
    Agent.get_and_update(bucket, &Map.pop(&1, key))
  end
end
