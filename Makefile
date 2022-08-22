ROOT_DIR=${PWD}

.DEFAULT_GOAL := help
.PHONY: pods

# tasks
help:
	@echo "Type: make [rule]. Available options are:"
	@echo ""
	@echo "- help"
	@echo "- pods"
	@echo "- pods-update"
	@echo "- pods-remove"
	@echo "- clear-cache"
	@echo "- test"
	@echo ""

pods:
	rm -rf Pods
	rm -rf Podfile.lock
	rm -rf GCastSample.xcworkspace
	pod install --no-repo-update

pods-update:
	rm -rf Pods
	rm -rf Podfile.lock
	rm -rf GCastSample.xcworkspace
	pod update
	pod install --repo-update

pods-remove:
	rm -rf Pods
	rm -rf Podfile.lock
	rm -rf GCastSample.xcworkspace

clear-cache:
	pod cache clean 'ub-google-cast-sdk-no-bluetooth' --all

test:
	@if [ -d "Pods/ub-google-cast-sdk-no-bluetooth/GoogleCast.xcframework" ]; then \
        echo "The dependency was installed with SUCCESS"; \
	else \
		echo "The dependency was NOT installed"; \
    fi
