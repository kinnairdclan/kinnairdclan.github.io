serve_dev:
	docker run -it --rm --volume ${PWD}:/srv/jekyll -p 4000:4000 kinnairdclan/coderbears_blog_dev

build_dev:
	docker build -t kinnairdclan/coderbears_blog_dev ${PWD}

build_prod:
	docker build -t kinnairdclan/coderbears_blog -f ${PWD}/Dockerfile.production ${PWD}

push_prod:
	docker push kinnairdclan/coderbears_blog
