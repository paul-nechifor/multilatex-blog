.PHONY: all full raw clean copy

all: clean full raw

full:
	jekyll build -s full -d full/_site

raw:
	jekyll build -s raw -d raw/_site
	sed -i 's/-data\/posts//g' raw/_site/blog-data/includes/side.html
	sed -i 's/.html//g' raw/_site/blog-data/includes/side.html

clean:
	rm -fr full/_site raw/_site

copy:
	rm -fr ../multilatex/app/public/blog-data
	cp -r raw/_site/blog-data ../multilatex/app/public/blog-data
