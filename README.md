# 🔬 OpenScout

**An AI-powered academic systematic literature review agent.**

OpenScout searches and ingests scholarly sources — arXiv preprints, Semantic Scholar records, CrossRef metadata, and PDF full-texts — resolves references across them, and synthesises research gaps, methodological patterns, and emerging trends through evidence-backed analysis.

---

## ✨ Features

| Tool | Description |
|------|-------------|
| `arxiv_search` | Search arXiv for preprints by query, returning titles, abstracts, authors, and PDF links |
| `semantic_scholar_lookup` | Look up papers on Semantic Scholar by query, DOI, arXiv ID, or S2 Paper ID |
| `openalex_search` | Search the OpenAlex academic database for works with citation counts, DOIs, and open access links |
| `crossref_resolve` | Resolve a DOI via CrossRef to get full citation metadata |
| `pdf_extract` | Extract text and tables from PDF documents (local files or URLs) |
| `web_search` | General web search via DuckDuckGo *(no API key needed)* |
| `read_file` / `write_file` | Read and write workspace files for notes, summaries, and reports |
| `run_shell` | Execute shell commands for data processing |

**Additional capabilities:**
- 🔄 **Recursive reasoning** — breaks complex literature reviews into sub-tasks automatically
- 📝 **Acceptance criteria** — self-validates output quality before finishing
- 🧠 **Multi-provider LLM support** — Google Gemini, OpenAI, Anthropic, Ollama, and more
- 📊 **Table extraction** — pulls methodology tables from PDFs into Markdown

---

## 🚀 Quick Start

### Prerequisites
- Python 3.10+ or Docker
- An API key for at least one LLM provider

### 1. Clone & Configure

```bash
git clone https://github.com/your-username/OpenScout.git
cd OpenScout

# Copy the example env and fill in your API key
cp .env.example .env
# Edit .env — at minimum, set GOOGLE_API_KEY (or another provider key)
```

### 2a. Run with Docker *(recommended)*

```bash
# Build and run
make setup
make run

# Or directly:
docker compose run --rm agent
```

### 2b. Run Locally

```bash
pip install -e .
source .env           # or: set -a && source .env && set +a
python -m agent --workspace ./workspace
```

---

## ⚙️ Configuration

All configuration is done through the `.env` file. See [`.env.example`](.env.example) for all options.

### Supported Providers

| Provider | Model Example | Env Variable |
|----------|--------------|--------------|
| **Google AI Studio** | `gemini-2.5-flash` | `GOOGLE_API_KEY` |
| **OpenAI** | `gpt-4o` | `OPENAI_API_KEY` |
| **Anthropic** | `claude-sonnet-4-20250514` | `ANTHROPIC_API_KEY` |
| **OpenRouter** | `anthropic/claude-sonnet-4-5` | `OPENROUTER_API_KEY` |
| **Cerebras** | `qwen-3-235b` | `CEREBRAS_API_KEY` |
| **Ollama** *(local)* | `llama3.2` | — *(no key needed)* |

Switch providers by changing two lines in `.env`:

```bash
OPENSCOUT_PROVIDER=google
OPENSCOUT_MODEL=gemini-2.5-flash
```

### CLI Options

```
--provider      Override the LLM provider (google, openai, anthropic, etc.)
--model         Override the model name
--workspace     Path to the working directory (default: ./workspace)
--max-steps     Maximum tool-call steps per task (default: 100)
--max-depth     Maximum recursion depth (default: 4)
--headless      Run without interactive TUI (for scripting)
--task          Provide a task directly instead of using the TUI
--configure-keys  Interactive API key setup
--list-models   List available models for a provider
```

---

## 📖 Usage Examples

### Interactive Mode
```bash
docker compose run --rm agent
```
Then type your research question in the TUI:
> *"Find the 10 most cited papers on Retrieval Augmented Generation, compare their architectures, and write a summary to review.md"*

### Headless Mode
```bash
docker compose run --rm agent \
  --headless \
  --max-steps 20 \
  --task "Search arXiv for papers on physics-informed neural networks published in 2024. Write a literature review to pinn_review.md."
```

### Using Ollama (Local Models)
```bash
# Install and start Ollama, then pull a model
ollama pull llama3.2

# Update .env
OPENSCOUT_PROVIDER=ollama
OPENSCOUT_MODEL=llama3.2

docker compose run --rm agent
```

---

## 🏗️ Project Structure

```
OpenScout/
├── agent/               # Core agent source code
│   ├── __main__.py      # CLI entry point
│   ├── engine.py        # Recursive reasoning engine & tool dispatch
│   ├── builder.py       # Model factory & provider wiring
│   ├── config.py        # Configuration dataclass
│   ├── credentials.py   # API key management
│   ├── prompts.py       # System prompts & persona
│   ├── tools.py         # Tool implementations (arxiv, S2, CrossRef, PDF)
│   └── tool_defs.py     # Tool schema definitions
├── tests/               # Unit tests
├── .env.example         # Template for environment configuration
├── Dockerfile           # Container image definition
├── docker-compose.yml   # Docker Compose service definition
├── Makefile             # Quick commands (setup, run, demo, clean)
└── pyproject.toml       # Python package metadata
```

---

## 🧪 Testing

```bash
# Run unit tests
python -m unittest discover -s tests -v

# Run the RAG Synthesis demo (requires API key)
make demo
```

---

## 📄 License

MIT — see [LICENSE](LICENSE).
