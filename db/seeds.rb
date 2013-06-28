
File.open('words').each_line do |line|
  Word.create(text: line.to_s.chomp, length: line.to_s.chomp.length)
end
