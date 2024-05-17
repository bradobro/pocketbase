lint:
	golangci-lint run -c ./golangci.yml ./...

test:
	go test ./... -v --cover

jstypes:
	go run ./plugins/jsvm/internal/types/types.go

test-report:
	go test ./... -v --cover -coverprofile=coverage.out
	go tool cover -html=coverage.out

build-ui:
	npm --prefix=./ui ci && npm --prefix=./ui run build
	
build-local:
  # goreleaser build adds -ldflags '-s -w -X github.com/pocketbase/pocketbase.Version={{ .Version }}' to the build command
	CGO_ENABLED=0 go build -o ./pocketbase ./examples/base
