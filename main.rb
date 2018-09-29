require_relative 'lib/cache'
require_relative 'lib/algorithm'
require_relative 'lib/fifo'
require_relative 'lib/lru'
require_relative 'lib/lfu'
require_relative 'lib/random'

path = ''
if ARGV.include?('--path')
	value_index = ARGV.index('--path') + 1
	path = ARGV[value_index]
end

cache_size = 1
if ARGV.include?('--size')
	value_index = ARGV.index('--size') + 1
	cache_size = ARGV[value_index].to_i
end

algorithm = ''
if ARGV.include?('--algorithm')
	value_index = ARGV.index('--algorithm') + 1
	algorithm = ARGV[value_index]
end

mem_refs = File.readlines(path).map(&:to_i)
cache = Cache.new(cache_size)

if algorithm.upcase == 'FIFO'
	algorithm = Fifo.new(cache)
elsif algorithm.upcase == 'LRU'
	algorithm = Lru.new(cache)
elsif algorithm.upcase == 'LFU'
	algorithm = Lfu.new(cache)
elsif algorithm.upcase == 'RANDOM'
	algorithm = Random.new(cache)
end

if algorithm
	algorithm.execute(mem_refs)
end

puts cache
puts algorithm
