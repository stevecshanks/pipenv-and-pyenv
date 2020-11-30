VIRTUALENV = .virtualenv.installed

.PHONY: dev
dev: $(VIRTUALENV)
	FLASK_APP=main pipenv run flask run

.PHONY: test
test: $(VIRTUALENV)
	pipenv run pytest

.PHONY: clean
clean:
	rm -f $(VIRTUALENV)
	pipenv --rm

$(VIRTUALENV): Pipfile
	pipenv install --dev
	touch -m $@
