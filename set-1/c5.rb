require './c2'
=begin

Implement repeating-key XOR

Here is the opening stanza of an important work of the English language:

Burning 'em, if you ain't quick and nimble
I go crazy when I hear a cymbal

Encrypt it, under the key "ICE", using repeating-key XOR.

In repeating-key XOR, you'll sequentially apply each byte of the key; the first byte of plaintext will be XOR'd against I, the next C, the next E, then I again for the 4th byte, and so on.

It should come out to:

0b3637272a2b2e63622c2e69692a23693a2a3c6324202d623d63343c2a26226324272765272
a282b2f20430a652e2c652a3124333a653e2b2027630c692b20283165286326302e27282f

Encrypt a bunch of stuff using your repeating-key XOR function. Encrypt your mail. Encrypt your password file. Your .sig file. Get a feel for it. I promise, we aren't wasting your time with this.
=end

#Simply proceed modularly through the array and fixed_xor the corresponding bytes.
def repeat_key_xor(text, key)
	hex_text = text.unpack('H*').join
	#Unpack the key into its individual letters
	key_array = key.unpack('H2H2H2')
	out = hex_text.scan(/../).map.with_index { |a, i| fixed_xor(a, key_array[i.modulo(3)]) }.join
end	

#str = "Burning 'em, if you ain't quick and nimble\nI go crazy when I hear a cymbal"
#puts str
#puts repeat_key_xor(str, "ICE")