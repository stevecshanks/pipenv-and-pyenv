PYTHON = .python.installed
VIRTUALENV = .virtualenv.installed

.PHONY: dev
dev: $(VIRTUALENV)
	FLASK_APP=main pipenv run flask run

.PHONY: test
test: $(VIRTUALENV)
	pipenv run pytest

.PHONY: clean
clean:
	rm -f $(VIRTUALENV) $(PYTHON)
	pipenv --rm

$(VIRTUALENV): Pipfile $(PYTHON)
	pipenv install --dev --python $(shell pyenv which python)
	touch -m $@

$(PYTHON): .python-version
	(pyenv versions | grep -q $(shell cat .python-version)) || pyenv install $(shell cat .python-version)
	touch -m $@
