install:
	bundler install

lint:
	bundle exec rubocop -a

.PHONY: test
test:
	bundle exec rake test
