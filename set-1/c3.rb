require './c2'
=begin

Single-byte XOR cipher

The hex encoded string:

1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736

... has been XOR'd against a single character. Find the key, decrypt the message.

You can do this by hand. But don't: write code to do it for you.

How? Devise some method for "scoring" a piece of English plaintext. Character frequency is a good metric. Evaluate each output and choose the one with the best score.
Achievement Unlocked

You now have our permission to make "ETAOIN SHRDLU" jokes on Twitter.
=end

#Scores a piece of plaintext based on the 'ETAOIN SRHDLU' frequency table. This approach multiplies each letter by its frequency
#value found in the following table: http://www.math.cornell.edu/~mec/2003-2004/cryptography/subs/frequencies.html. (This is not
#the ideal method though, as 'eeeeeeeeeeee' would get a higher score than any real sentence of the same length, but is suitable
#for this problem).
def frequency_score(str)
	score = 0.0
	hsh = {"e" => 12.02, "t" => 9.10, "a" => 8.12, "o" => 7.68, "i" => 7.31, "n" => 6.95, "s" => 6.28, 
	        "r" => 6.02, "h" =>5.92, "d" => 4.32, "l" => 3.98, "u" => 2.88}
	hsh.default = 0.0
	if (str.split(' ').join.length != str.length) then str.split(//).map { |a| score += hsh[a]} end
	score
end

str = '1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736'
max = 0.0
decoded = {}

#Look at all possible chars from value 0-255 and XOR them against the encoded string.
#This returns the original string, which is then decoded to English plaintext via pack
#and passed to the frequency scorer

(0..255).each do |i|
	out = str.scan(/../).map{ |a| fixed_xor(a, i.to_s(16))}.join
	output_string = [out].pack('H*')
	output_score = frequency_score(output_string)
	decoded[output_score] = output_string
	if output_score > max then max = output_score end
end

puts decoded[max]