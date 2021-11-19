release:
	pip install -U twine
	pip install -U setuptools
	pip install -U pip
	make clean
	python setup.py sdist
	python -m twine upload --verbose dist/*

clean :
	rm -rf dist
	rm -rf build
	rm -rf gaia_source.egg-info
	rm -rf .tox
    
install: clean
	pip uninstall gaia_source
	python setup.py build
	python setup.py install

build-docs:
	pip install sphinx sphinx_rtd_theme pip setuptools -U
	mkdir -p /tmp/docs
	rm -rf /tmp/docs/*
	sphinx-build -b html docs/ /tmp/docs

tests:
	pytest gaia_source_tests/test_all.py -x
