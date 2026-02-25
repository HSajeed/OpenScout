.PHONY: build run setup clean help demo

# Default task: show help
help:
	@echo "OpenScout Academic Assistant - Quick Commands"
	@echo "--------------------------------------------"
	@echo "make setup    - Build the Docker container and create workspace"
	@echo "make run      - Enter interactive mode (TUI)"
	@echo "make demo     - Run the RAG Synthesis smoke test"
	@echo "make clean    - Remove build artifacts and stopped containers"

setup:
	mkdir -p workspace
	docker compose build

run:
	docker compose run --rm agent

demo:
	docker compose run --rm agent --task "Find the 10 most cited papers on RAG (Retrieval Augmented Generation), extract their methodologies from the full PDFs, and identify common evaluation benchmarks." --max-depth 4

clean:
	docker compose down --remove-orphans
	rm -rf build/ dist/ *.egg-info
