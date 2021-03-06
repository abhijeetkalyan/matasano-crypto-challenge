=begin

Fixed XOR

Write a function that takes two equal-length buffers and produces their XOR combination.

If your function works properly, then when you feed it the string:

1c0111001f010100061a024b53535009181c

... after hex decoding, and when XOR'd against:

686974207468652062756c6c277320657965

... should produce:

746865206b696420646f6e277420706c6179

=end

def fixed_xor(str1, str2)
	out = str1.hex ^ str2.hex
	hex_str = out.to_s(16)
	if hex_str.length > 1 then out.to_s(16) else out.to_s(16).rjust(2, '0') end
end

#puts fixed_xor('1c0111001f010100061a024b53535009181c', '686974207468652062756c6c277320657965')