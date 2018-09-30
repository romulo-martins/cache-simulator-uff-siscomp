require_relative 'initializer'

args_reader = ArgsReader.new(ARGV)
cache_size = args_reader.get_cache_size
cache = Cache.new(cache_size)

mapping_name = args_reader.get_mapping
if mapping_name.upcase == 'ASSOCIATIVE'
	algorithm_name = args_reader.get_algorithm
	mapping = Mapping::Associative.new(cache, algorithm_name)
elsif mapping_name.upcase == 'DIRECT'
	mapping = Mapping::Direct.new(cache)
else
	puts 'Error: Não é um mapeamento válido!'
end

if mapping
	path = args_reader.get_path
	mem_refs = File.readlines(path).map(&:to_i)
	mapping.execute(mem_refs)
end

puts cache
puts mapping
