defmodule KVBucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = KV.Bucket.start_link()
    {:ok, bucket: bucket}
  end

  test "stores values by key", %{bucket: bucket} do
    assert KV.Bucket.get(bucket, "oak") == nil

    KV.Bucket.put(bucket, "oak", 3)
    assert KV.Bucket.get(bucket, "oak") == 3
  end

  test "deletes key in bucket", %{bucket: bucket} do
    KV.Bucket.put(bucket, "oak", 5)

    assert KV.Bucket.delete(bucket, "oak") == 5
    assert KV.Bucket.get(bucket, "oak") == nil
  end
end
