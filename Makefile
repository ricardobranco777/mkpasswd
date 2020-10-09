test:
	@pylint mkpasswd --disable=line-too-long
	@flake8 mkpasswd --ignore=E501
	@./test.sh
