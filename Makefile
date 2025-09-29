.PHONY: run

run:
	@chmod +x alarm.sh
	@bash -c '\
		OS=$$(uname); \
		if [[ "$$OS" == "Linux" ]]; then \
			missing=""; \
			for cmd in acpi speech-dispatcher; do \
				if ! dpkg -s $$cmd &> /dev/null; then \
					missing="$$missing $$cmd"; \
				fi; \
			done; \
			if [[ ! -z "$$missing" ]]; then \
				echo "Installing missing dependencies:$$missing"; \
				sudo apt update && sudo apt install -y $$missing; \
			else \
				echo "All dependencies are already installed."; \
			fi; \
			systemd-inhibit --why="Anti-theft alarm" --mode=block ./alarm.sh; \
		elif [[ "$$OS" == "Darwin" ]]; then \
			missing=""; \
			for cmd in pmset say; do \
				if ! command -v $$cmd &> /dev/null; then \
					missing="$$missing $$cmd"; \
				fi; \
			done; \
			if [[ ! -z "$$missing" ]]; then \
				echo "Installing missing dependencies:$$missing"; \
				for pkg in $$missing; do \
					brew install $$pkg; \
				done; \
			else \
				echo "All dependencies are already installed."; \
			fi; \
			./alarm.sh; \
		fi'
