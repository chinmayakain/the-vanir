postgres:
	docker run --name postgres16 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=1234 -d postgres:16-alpine

createdb: 
	docker exec -it postgres16 createdb --username=root --owner=root the-vanir

migrateup:
	migrate -path db/migration -database "postgresql://root:1234@localhost:5432/the-vanir?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:1234@localhost:5432/the-vanir?sslmode=disable" -verbose down

dropdb:
	docker exec -it postgres16 dropdb the-vanir

postgresstop: 
	docker stop postgres16

sqlc: 
	sqlc generate

.PHONY: postgres createdb migrateup migratedown dropdb postgresstop sqlc