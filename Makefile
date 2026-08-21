# READ THE DOCUMENTATION HERE : https://github.com/leboncoin/spark-ios/blob/main/docs/MAKEFILE.md

.PHONY: build test docc clean clear-snapshots sourcery

PACKAGES = $(shell find Dependencies -maxdepth 1 -mindepth 1 -type d -exec basename {} \; | sort)
RESULTS_DIR = .testResults
DERIVED_DATA_PATH = .derivedData/
SDK = iphonesimulator
DESTINATION = platform=iOS Simulator,name=iPhone 17 Pro Max,OS=26.4.1
XCODEBUILD_FLAGS = -derivedDataPath $(DERIVED_DATA_PATH) -sdk $(SDK) -destination "$(DESTINATION)"
DOCC_OUTPUT_PATH = .docs
HOSTING_BASE_PATH ?= spark-ios

###################################
#######################
###########

##
## BUILD
##

# Build the project ($ make build)
build:
	@failed_pkgs=""; \
	if ! xcodebuild -scheme Spark-Package $(XCODEBUILD_FLAGS) build; then \
		failed_pkgs="$$failed_pkgs Spark"; \
	fi; \
	if [ -n "$$failed_pkgs" ]; then \
		echo "\n✗ Failed packages:$$failed_pkgs"; \
		exit 1; \
	else \
		echo "\n✓ All packages built successfully"; \
	fi

###########
#######################
###################################

###################################
#######################
###########

##
## TESTS
##

# Run tests with .xcresult bundles ($ make test)
test: sourcery
	@mkdir -p $(RESULTS_DIR)/xcresult
	@rm -rf $(RESULTS_DIR)/xcresult/*.xcresult
	@echo "Running snapshot tests for Spark..."; \
	if ! xcodebuild -scheme Spark-Package $(XCODEBUILD_FLAGS) -resultBundlePath $(RESULTS_DIR)/xcresult/Spark-snapshots.xcresult test; then \
		echo "\n✗ Tests failed"; \
		exit 1; \
	fi; \
	echo ""; \
	echo "XCResult bundles saved to $(RESULTS_DIR)/xcresult/"; \
	ls -la $(RESULTS_DIR)/xcresult/*.xcresult 2>/dev/null || true; \
	echo "\n✓ All tests completed successfully"

###########
#######################
###################################

###################################
#######################
###########

##
## DOCUMENTATION
##

# Generate DocC documentation for all packages ($ make docc or $ make docc DOCC_OUTPUT_PATH=mu-output-path HOSTING_BASE_PATH=my-custom-path)
# To test locally, use :
# $ cd .docs && python3 -m http.server 8000
# Then open http://localhost:8000
docc:
	@echo "Generating DocC documentation..."
	@mkdir -p $(DOCC_OUTPUT_PATH)
	@echo "Building DocC for Spark..."; \
	if ! xcodebuild docbuild -scheme Spark-Package -derivedDataPath $(DERIVED_DATA_PATH) -destination 'generic/platform=iOS'; then \
		echo "\n✗ DocC build failed"; \
		exit 1; \
	fi; \
	echo ""; \
	echo "Processing all .doccarchive files..."; \
	for archive in $(DERIVED_DATA_PATH)/Build/Products/Debug-iphoneos/*.doccarchive; do \
		if [ -d "$$archive" ]; then \
			archive_name=$$(basename "$$archive" .doccarchive); \
			if echo "$$archive_name" | grep -q "Testing"; then \
				echo "Skipping $$archive_name (contains 'Testing')"; \
				continue; \
			fi; \
			echo "Processing DocC archive for $$archive_name..."; \
			pkg_lower=$$(echo $$archive_name | tr '[:upper:]' '[:lower:]'); \
			$$(xcrun --find docc) process-archive \
				transform-for-static-hosting $$archive \
				--output-path $(DOCC_OUTPUT_PATH)/$$pkg_lower \
				--hosting-base-path $(HOSTING_BASE_PATH)/$$pkg_lower; \
			if [ -f "Dependencies/$$archive_name/documentation.json" ]; then \
				cp Dependencies/$$archive_name/documentation.json $(DOCC_OUTPUT_PATH)/$$pkg_lower/documentation.json; \
				echo "Copied documentation.json from Dependencies/$$archive_name to $(DOCC_OUTPUT_PATH)/$$pkg_lower/"; \
			elif [ -f "Spark/documentation.json" ]; then \
				cp Spark/documentation.json $(DOCC_OUTPUT_PATH)/$$pkg_lower/documentation.json; \
				echo "Copied documentation.json from Spark to $(DOCC_OUTPUT_PATH)/$$pkg_lower/"; \
			fi; \
			echo ""; \
		fi; \
	done; \
	if [ -d ".documentation" ]; then \
		cp -r .documentation/* $(DOCC_OUTPUT_PATH)/; \
		echo "Copied all files from .documentation/ to $(DOCC_OUTPUT_PATH)/"; \
	fi; \
	echo ""; \
	echo "Generating packages.json with metadata..."; \
	echo "[" > $(DOCC_OUTPUT_PATH)/packages.json; \
	first=true; \
	for dir in $$(find $(DOCC_OUTPUT_PATH) -mindepth 1 -maxdepth 1 -type d | sort); do \
		if [ -f "$$dir/documentation.json" ]; then \
			folder=$$(basename "$$dir"); \
			if [ "$$first" = true ]; then \
				first=false; \
			else \
				printf ",\n" >> $(DOCC_OUTPUT_PATH)/packages.json; \
			fi; \
			title=$$(grep '"title"' "$$dir/documentation.json" | head -1 | sed 's/.*"title"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/'); \
			description=$$(grep '"description"' "$$dir/documentation.json" | head -1 | sed 's/.*"description"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/'); \
			image=$$(grep '"image"' "$$dir/documentation.json" | head -1 | sed 's/.*"image"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/'); \
			zeroheight=$$(grep '"zeroheight"' "$$dir/documentation.json" | head -1 | sed 's/.*"zeroheight"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/'); \
			figma=$$(grep '"figma"' "$$dir/documentation.json" | head -1 | sed 's/.*"figma"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/'); \
			printf "  {\n    \"title\": \"$$title\",\n    \"description\": \"$$description\",\n    \"image\": \"$$image\",\n    \"path\": \"$$folder/documentation/$$folder\"" >> $(DOCC_OUTPUT_PATH)/packages.json; \
			if [ -n "$$zeroheight" ]; then \
				printf ",\n    \"zeroheight\": \"$$zeroheight\"" >> $(DOCC_OUTPUT_PATH)/packages.json; \
			fi; \
			if [ -n "$$figma" ]; then \
				printf ",\n    \"figma\": \"$$figma\"" >> $(DOCC_OUTPUT_PATH)/packages.json; \
			fi; \
			printf "\n  }" >> $(DOCC_OUTPUT_PATH)/packages.json; \
		fi; \
	done; \
	printf "\n]\n" >> $(DOCC_OUTPUT_PATH)/packages.json; \
	echo "Generated packages.json with $$(grep -c '"title"' $(DOCC_OUTPUT_PATH)/packages.json) packages"; \
	echo "\n✓ DocC documentation generated successfully in $(DOCC_OUTPUT_PATH)/"

###########
#######################
###################################

###################################
#######################
###########

##
## CLEAR & CLEAN
##

# Clean build artifacts and derived data, documentation and mocks ($ make clean)
clean:
	swift package clean
	@rm -rf $(DERIVED_DATA_PATH)
	@rm -rf $(DOCC_OUTPUT_PATH)
	@echo "Removing Sourcery generated files..."
	@find Dependencies -type f -name "Sourcery.generated.swift" -delete 2>/dev/null || true
	@find Spark -type f -name "Sourcery.generated.swift" -delete 2>/dev/null || true
	@echo "✓ Sourcery generated files removed"

# Remove all snapshot files from Tests folders ($ make clear-snapshots)
clear-snapshots:
	@for pkg in $(PACKAGES); do \
		if [ -d "Dependencies/$$pkg/Tests" ]; then \
			echo "Checking $$pkg for snapshots..."; \
			find Dependencies/$$pkg/Tests -type d -name "*.__snapshots__" -exec sh -c 'echo "Clearing snapshots in {}"; rm -rf {}/*' \; ; \
		fi \
	done
	@if [ -d "Spark/Tests" ]; then \
		echo "Checking Spark for snapshots..."; \
		find Spark/Tests -type d -name "*.__snapshots__" -exec sh -c 'echo "Clearing snapshots in {}"; rm -rf {}/*' \; ; \
	fi
	@echo "\n✓ All snapshots cleared successfully"

###########
#######################
###################################

###################################
#######################
###########

##
## SOURCERY
##

# Run Sourcery for all packages ($ make sourcery)
sourcery:
	@echo "Running Sourcery for root package..."
	@if [ -f ".sourcery.yml" ]; then \
		sourcery --config .sourcery.yml; \
	fi
	@echo ""
	@for pkg in $(PACKAGES); do \
		if [ -f "Dependencies/$$pkg/.sourcery.yml" ]; then \
			echo "Running Sourcery for $$pkg..."; \
			cd Dependencies/$$pkg && sourcery --config .sourcery.yml && cd ../..; \
			echo ""; \
		fi \
	done
	@if [ -f "Spark/.sourcery.yml" ]; then \
		echo "Running Sourcery for Spark..."; \
		cd Spark && sourcery --config .sourcery.yml && cd ..; \
		echo ""; \
	fi
	@echo "✓ Sourcery completed for all packages"

###########
#######################
###################################
