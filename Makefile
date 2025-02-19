test:
	prove t

testv:
	prove -v t

cover:
	PERL5OPT=-MDevel::Cover=+ignore,/usr/bin/prove prove t/ && cover

clean:
	rm -rf cover_db

