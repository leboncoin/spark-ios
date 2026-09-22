# READ THE DOCUMENTATION HERE : https://github.com/leboncoin/spark-ios/blob/main/docs/MAKEFILE.md

.PHONY: build build-demo-app test docc clean clear-snapshots sourcery

PACKAGES = $(shell find Dependencies -maxdepth 1 -mindepth 1 -type d -exec basename {} \; | sort)
RESULTS_DIR = .testResults
DERIVED_DATA_PATH = .derivedData/
SDK = iphonesimulator
DESTINATION = platform=iOS Simulator,name=iPhone 17 Pro Max,OS=26.4.1
XCODEBUILD_FLAGS = -derivedDataPath $(DERIVED_DATA_PATH) -sdk $(SDK) -destination "$(DESTINATION)"
DOCC_OUTPUT_PATH = .docs
HOSTING_BASE_PATH ?= spark-ios
DEMO_APP_NAME = SparkDemoApp
DEMO_APP_DESTINATION = platform=iOS Simulator,name=iPhone 17,OS=26.2

###################################
#######################
###########

##
## BUILD
##

# Build the project ($ make build)
build: sourcery
	@rm -rf Spark.xcodeproj # xcodebuild silently prefers this over the Spark-Package SPM scheme when both exist
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

##
## BUILD DEMO APP
##

# Build the demo app for the iOS Simulator, requires xcodegen to have been run ($ make build-demo-app)
build-demo-app:
	@echo "Building $(DEMO_APP_NAME)..."; \
	if ! xcodebuild -scheme $(DEMO_APP_NAME) -derivedDataPath $(DERIVED_DATA_PATH) -sdk $(SDK) -destination "$(DEMO_APP_DESTINATION)" -resultBundlePath $(DEMO_APP_NAME).xcresult build; then \
		echo "\n✗ $(DEMO_APP_NAME) build failed"; \
		exit 1; \
	else \
		echo "\n✓ $(DEMO_APP_NAME) built successfully"; \
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

# Run unit and snapshots tests with .xcresult bundles ($ make test)
test: sourcery
	@rm -rf Spark.xcodeproj # xcodebuild silently prefers this over the Spark-Package SPM scheme when both exist
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
	@rm -rf Spark.xcodeproj # xcodebuild silently prefers this over the Spark-Package SPM scheme when both exist
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
			dep_name=$$(echo "$$archive_name" | sed 's/^Spark//'); \
			if [ -f "Dependencies/$$dep_name/documentation.json" ]; then \
				cp "Dependencies/$$dep_name/documentation.json" $(DOCC_OUTPUT_PATH)/$$pkg_lower/documentation.json; \
				echo "Copied documentation.json from Dependencies/$$dep_name to $(DOCC_OUTPUT_PATH)/$$pkg_lower/"; \
			elif [ -n "$$dep_name" ] && [ -f "$$dep_name/documentation.json" ]; then \
				cp "$$dep_name/documentation.json" $(DOCC_OUTPUT_PATH)/$$pkg_lower/documentation.json; \
				echo "Copied documentation.json from $$dep_name to $(DOCC_OUTPUT_PATH)/$$pkg_lower/"; \
			elif [ "$$archive_name" = "Spark" ] && [ -f "Spark/documentation.json" ]; then \
				cp "Spark/documentation.json" $(DOCC_OUTPUT_PATH)/$$pkg_lower/documentation.json; \
				echo "Copied documentation.json from Spark to $(DOCC_OUTPUT_PATH)/$$pkg_lower/"; \
			else \
				echo "No documentation.json found for $$archive_name, skipping card"; \
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
	if ! .script/generate-packages-json.swift $(DOCC_OUTPUT_PATH); then \
		echo "\n✗ packages.json generation failed"; \
		exit 1; \
	fi; \
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
