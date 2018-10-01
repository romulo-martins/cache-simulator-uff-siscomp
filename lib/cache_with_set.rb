class CacheWithSet
	attr_reader :cache_size, :set_size, :set, :erros

	def initialize(cache_size, set_size)
		@cache_size = cache_size
		@set_size = set_size
		@erros = []
		@set = load_set
	end

	def to_s
		resp = "-------------- Cache -------------\n"
		resp << " Pos Conj. | Pos Quadro | Mem Ref \n"
		resp << "----------------------------------\n"
		set.each_with_index do |frames, set_index|
			frames.each_with_index do |frame, frame_index|
				resp << (" " * (11 - set_index.to_s.size)) + "#{set_index}|"
				resp << (" " * (12 - frame_index.to_s.size)) + "#{frame_index}|"
				resp << (" " * (9 - frame.to_s.size)) + "#{frame}|\n"
			end	
		end
		resp << "----------------------------------\n\n"
		resp
	end
	
	private

	def load_set
		if cache_size % set_size == 0
			total_sets = cache_size / set_size
			(0...total_sets).map { [Cache::EMPTY_FRAME] * set_size }
		else
			erros << "Error: O tamanho da cache e do conjunto precisam ser multiplos!"
			nil
		end
	end	
end
