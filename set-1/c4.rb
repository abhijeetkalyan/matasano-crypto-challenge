require './c3'
=begin

Detect single-character XOR

One of the 60-character strings in this file has been encrypted by single-character XOR.

Find it.

(Your code from #3 should help.)
=end

File.open('c4.txt').each_line do |line|
	out = xor_parse(line)
	tmp = out.scan(/[[:punct:]]/)
	tmp2 = out.scan(/[[:lower:]]/)
	puts out if tmp.length < 2  && tmp2.length > 20
end	
