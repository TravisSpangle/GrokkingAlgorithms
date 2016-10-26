module SpellChecker
  refine String do
    def spell_check_score(word)
      spelling_matrix = generate_matrix(word)

      current_score = 0
      (0...spelling_matrix.length).each do |i|
        current_score += 1 if self[i] == word[i]

        (i...spelling_matrix.length).each do |fill_index|
          spelling_matrix[fill_index][i] = current_score
          spelling_matrix[i][fill_index] = current_score
        end
      end

      spelling_matrix.last.last
    end

    private

    def generate_matrix(word)
      Array.new(self.length) { Array.new(word.length) { 0 } }
    end
  end
end

using SpellChecker

word = "fosh"

%w(fort fish).each do |sample_word|
  puts "Is #{word} supposed to be #{sample_word}? Score:  #{word.spell_check_score(sample_word)} "
end
# Is fosh supposed to be fort? Score:  2
# Is fosh supposed to be fish? Score:  3
