install:
	cp scripts/*.sh /usr/local/bin
	chmod +x /usr/local/bin/*.sh

lock:
	sudo ./scripts/versionlock-kernel.sh

unlock:
	sudo ./scripts/unlock-kernel.sh

check:
	./scripts/check_akmods.sh

cleanlog:
	rm -f ~/.akmods-check.log
