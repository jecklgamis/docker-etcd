APP_NAME:=etcd
VERSION:=v1.0.0-alpha.1
HELM_CHART_FILE=./$(APP_NAME)-$(VERSION).tgz

help:
	@cat ./Makefile
package:
	rm -f $(HELM_CHART_FILE)
	helm package ./$(APP_NAME)
dry-run:
	@helm install --dry-run --debug $(APP_NAME) ./$(APP_NAME) | tee dry-run.txt
install: package
	@helm install $(APP_NAME) $(HELM_CHART_FILE)
uninstall:
	@helm uninstall $(APP_NAME)
upgrade: package
	@helm upgrade $(APP_NAME) $(HELM_CHART_FILE)
rollback:
	@helm rollback $(APP_NAME)
clean:
	@rm 0f $(HELM_CHART_FILE)
all: package
