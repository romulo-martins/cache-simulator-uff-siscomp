require_relative 'initializer'

args_reader = ArgsReader.new(ARGV)
cache_size = args_reader.get_cache_size
cache = Cache.new(cache_size)

mapping_name = args_reader.get_mapping
if mapping_name.upcase == 'ASSOCIATIVE'
	algorithm_name = args_reader.get_algorithm
	set_size = args_reader.get_set_size
	if set_size > 1
		cache = CacheWithSet.new(cache_size, set_size)
		mapping = Mapping::AssociativeBySet.new(cache, algorithm_name)
	else
		mapping = Mapping::Associative.new(cache, algorithm_name)
	end	
elsif mapping_name.upcase == 'DIRECT'
	mapping = Mapping::Direct.new(cache)
else
	puts 'Error: Não foi informado um mapeamento válido!'
end

if mapping
	path = args_reader.get_path
	mem_refs = File.readlines(path).map(&:to_i)
	mapping.execute(mem_refs)
end

puts cache
puts mapping
