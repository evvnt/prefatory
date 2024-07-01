require 'prefatory/storage/redis_provider'
require 'connection_pool'
require_relative '../prefatory_shared'

RSpec.describe Prefatory::Storage::RedisProvider do

  context 'when passing a connection pool object' do
    let(:repo) {Prefatory::Repository.new(storage: storage)}
    let(:redis_pool) {ConnectionPool.new(size: 5, timeout: 5) { Redis.new}}
    let(:storage) {Prefatory::Storage::RedisProvider.new(redis_client: redis_pool)}
    include_examples 'prefatory_repository'
  end

  context 'when using a redis connection' do
    let(:repo) {Prefatory::Repository.new(storage: storage)}
    let(:storage) {Prefatory::Storage::RedisProvider.new}
    include_examples 'prefatory_repository'
  end
end
