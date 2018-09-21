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
	end	
	print_cache(cache, misses, hits)	
end	

def lru(cache, mem_refs)
	misses = 0
	hits = 0
	count = [0] * cache.size
	mem_refs.each do |value|
		if cache.include?(value) 
			hits += 1
			value_index = cache.index(value)
			count[value_index] = 0
		else
			misses += 1
			if cache.include?(-1)
				cache[cache.index(-1)] = value
			else
				count_index = count.index(count.max)
				cache[count_index] = value
				count[count_index] = 0
			end
		end
		count.map! { |c| c += 1 }
	end
	print_cache(cache, misses, hits)	
end	

def lfu(cache, mem_refs)
	misses = 0
	hits = 0
	hit_count = [0] * cache.size
	mem_refs.each do |value|
		if cache.include?(value)
			hits += 1
			value_index = cache.index(value)
			hit_count[value_index] += 1
		else
			misses += 1
			if cache.include?(-1)
				empty_index = cache.index(-1)
				cache[empty_index] = value
				hit_count[empty_index] += 1
			else
				min_hit_index = hit_count.index(hit_count.min)
				cache[min_hit_index] = value
				hit_count[min_hit_index] = 0
			end	
		end
	end	
	print_cache(cache, misses, hits)
end

def random(cache, mem_refs)
	# TODO: 
	puts "Random não implementado!"
end	

def print_cache(cache, misses, hits)
	puts("--- Cache ---")
	cache.each_with_index do |value, index|
		puts "|  #{index}  |  #{value}  |"		
	end
	puts('-------------')
	puts("Misses: #{misses}, Hits: #{hits}")
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

algorithm = ''
if ARGV.include?('--algorithm')
	value_index = ARGV.index('--algorithm') + 1
	algorithm = ARGV[value_index]
end

mem_refs = File.readlines(path).map(&:to_i)
cache = [-1] * cache_size

if algorithm.upcase == 'FIFO'
	fifo(cache, mem_refs)
elsif algorithm.upcase == 'LRU'
	lru(cache, mem_refs)
elsif algorithm.upcase == 'LFU'
	lfu(cache, mem_refs)
elsif algorithm.upcase == 'RANDOM'
	random(cache, mem_refs)
else
	puts 'Error: Algoritmo invalido!'
end
