#!/usr/bin/ruby

# Vou refatorar, calma!
def fifo(cache, mem_refs)
	misses = 0
	hits = 0
	first_index = 0
	mem_refs.each do |value|
		if cache.include?(value) 
			hits += 1
		else
			misses += 1
			if cache.include?(-1)
				cache[cache.index(-1)] = value
			else
				cache[first_index] = value
				first_index = (first_index + 1) % cache.size
			end
		end
		print_cache(cache, misses, hits)	
	end	
end	

def lru(cache, mem_refs)
	# TODO: 
end	

def lfu(cahce, mem_refs)
	# TODO: 
end

def random(cache, mem_refs)
	# TODO: 
end	

def print_cache(cache, misses, hits)
	puts("--- Cache ---")
	cache.each_with_index do |value, index|
		puts "|  #{index}  |  #{value}  |"		
	end
	puts('-------------')
	print("Misses: #{misses}, Hits: #{hits}")
	puts
end	

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

algorithm = 1
if ARGV.include?('--algorithm')
	value_index = ARGV.index('--algorithm') + 1
	algorithm = ARGV[value_index]
end

mem_refs = File.readlines(path).map(&:to_i)
cache = [-1] * cache_size

if algorithm == 'FIFO'
	fifo(cache, mem_refs)
else
	puts 'Error: Algoritmo invalido!'
end


