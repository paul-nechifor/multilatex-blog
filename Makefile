.PHONY: all site clean

all: clean site

clean:
	rm -fr _site

site:
	jekyll build
	mkdir _site/blog-data/posts
	for f in `ls _site/blog`; do mv _site/blog/$$f/index.html _site/blog-data/posts/$$f.html; done
	rm -fr _site/blog
	rm -fr ../multilatex/app/public/blog-data
	cp -r _site/blog-data ../multilatex/app/public/blog-data
	rm -fr ../multilatex/app/public/static/blog
	cp -r _site/static/blog ../multilatex/app/public/static/blog
