# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_RailsCoder_session',
  :secret      => 'f7dfcfe5ff7f7ecb5aab48182a559f470b0db1e4f031350dc381aee6716c10224d7310b78ce9fe6d3f10755153fa2b66dcc15a2b231e28328f5a1f084e136f5d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
