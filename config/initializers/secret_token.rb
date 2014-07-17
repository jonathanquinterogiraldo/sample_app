# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		# Use the existing token.
		File.read(token_file).chomp
	else
		# Generate a new token and store it in token_file
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end
SampleApp::Application.config.secret_key_base = 'e8e46e943f53a7d779d68f0a404920e33ef43a6d3c62682b6b80579b031059c7ac0dec954ec7d45dabdabf9fe9bad503954c9a6c6c577d6289a2ced3dd68f2e5'
