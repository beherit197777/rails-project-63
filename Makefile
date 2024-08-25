install: # установить зависимости
	bundle install

lint: # запустить линтер
	bundle exec rubocop

test: # запустить тесты
	bundle exec rake test

.PHONY: test