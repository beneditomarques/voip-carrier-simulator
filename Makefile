build:
	# make build ver=1.1.0
	@[ "${ver}" ] || ( echo ">> var ver is not set"; exit 1 )
	docker build -t voip-carrier-simulator:${ver} voip-carrier-simulator/	
up:	
	docker-compose up -d
down:	
	docker-compose down
