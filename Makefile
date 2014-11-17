build:
	docker build -t even/share .

run:
	docker run -p 5000:5000 -d even/share

test:
	curl $(boot2docker ip):5000
