require_relative 'initializer'

args_reader = ArgsReader.new(ARGV)
path = args_reader.get_path
cache_size = args_reader.get_cache_size
algorithm_name = args_reader.get_algorithm

mem_refs = File.readlines(path).map(&:to_i)
cache = Cache.new(cache_size)

if algorithm_name.upcase == 'FIFO'
	algorithm = Fifo.new(cache)
elsif algorithm_name.upcase == 'LRU'
	algorithm = Lru.new(cache)
elsif algorithm_name.upcase == 'LFU'
	algorithm = Lfu.new(cache)
elsif algorithm_name.upcase == 'RANDOM'
	algorithm = Rand.new(cache)
else
	puts "Algoritmo não reconhecido!"	
end

if algorithm
	algorithm.execute(mem_refs)
end

puts cache
puts algorithm
