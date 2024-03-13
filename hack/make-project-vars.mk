PROJECT_DIR := $(PWD)
BIN_DIR := $(PROJECT_DIR)/bin
ENVTEST_ASSETS_DIR := $(PROJECT_DIR)/testbin

GOROOT ?= $(shell go env GOROOT)
GOBIN ?= $(BIN_DIR)
GOOS ?= $(shell go env GOOS)
GOARCH ?= $(shell go env GOARCH)

GO_LINT_IMG_LOCATION ?= golangci/golangci-lint
GO_LINT_IMG_TAG ?= v1.56.2
GO_LINT_IMG ?= $(GO_LINT_IMG_LOCATION):$(GO_LINT_IMG_TAG)

ifeq ($(IMAGE_BUILD_CMD),)
IMAGE_BUILD_CMD := $(shell command -v docker || echo "")
endif

ifeq ($(IMAGE_BUILD_CMD),)
IMAGE_BUILD_CMD := $(shell command -v podman || echo "")
endif
