class Lru
	attr_reader :hits, :misses

	def initialize(frames)
		@frames = frames
		@hits = 0
		@misses = 0
		@count = [0] * frames.size
	end	

	def add(mem_ref)
		if frames.include?(mem_ref) 
			@hits += 1
			value_index = frames.index(mem_ref)
			@count[value_index] = 0
		else
			@misses += 1
			if frames.include?(Cache::EMPTY_FRAME)
				empty_frame_index = frames.index(Cache::EMPTY_FRAME)
				frames[empty_frame_index] = mem_ref
			else
				count_index = @count.index(@count.max)
				frames[count_index] = mem_ref
				@count[count_index] = 0
			end
		end
		@count.map! { |c| c += 1 }
	end	

	def execute(mem_refs = [])
		mem_refs.each do |mem_ref|
			add(mem_ref)
		end
	end

	def to_s
		'LRU'
	end	

	private

	attr_reader :frames
end
