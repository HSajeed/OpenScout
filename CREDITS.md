# Credits & Attribution

## Original Project

**OpenPlanter** — An AI-powered investigation agent  
**Author:** [ShinMegamiBoson](https://github.com/ShinMegamiBoson)  
**Original Repository:** [github.com/ShinMegamiBoson/OpenPlanter](https://github.com/ShinMegamiBoson/OpenPlanter)  
**License:** MIT

This project is based on the original OpenPlanter architecture and codebase.

---

## Modifications by HSajeed

### Project Rebrand: OpenPlanter → OpenScout

**From:** Corporate/government investigation agent  
**To:** Academic systematic literature review agent

### Major Changes

#### 📚 Tool Ecosystem Overhaul

**Replaced:**
- `exa_search` (Exa web search API) → Removed with deprecation linting
- Generic web search focus → Academic research focus

**Added:**
- `arxiv_search` — Search arXiv preprints by query
- `semantic_scholar_lookup` — Lookup papers by query, DOI, arXiv ID, or S2 Paper ID
- `openalex_search` — OpenAlex academic database search
- `crossref_resolve` — DOI resolution via CrossRef API
- `pdf_extract` — Extract text and tables from academic PDFs

**Retained (Unchanged):**
- Core agent architecture (engine, model, runtime, tools)
- File I/O and workspace management
- Shell command execution
- Web search via DuckDuckGo
- Multi-provider LLM support (Google, OpenAI, Anthropic, OpenRouter, Cerebras, Ollama)
- Recursive reasoning and session persistence
- TUI (terminal user interface)

#### 📝 Documentation & Branding

**File Changes:**
- `README.md`: Rewritten for academic use case (from corporate investigation → literature review)
- `tool_defs.py`: Updated description from "OpenPlanter" → "OpenScout"
- System prompts: Reoriented toward academic research guidance
- Demo task: Changed from "vendor/lobbying" to "RAG papers research"

#### Code Additions

**agent/tools.py:**
- `_reconstruct_abstract()` — Parse OpenAlex inverted index format
- `openalex_search()` — New ~80 line method for OpenAlex API integration
- Removed exa API methods (~40 lines)

**agent/tool_defs.py:**
- 5 new academic tool schemas (~100 lines added)
- Updated web_search description (DuckDuckGo, no API key)

**agent/engine.py:**
- ~40 lines added (engine enhancements)

**agent/__main__.py, config.py, credentials.py, prompts.py:**
- Minor updates to support new academic tools and provider routing

#### 📊 Line Count Summary

| File | Original | Modified | Change |
|------|----------|----------|--------|
| tools.py | 887 | 1170 | +283 |
| tool_defs.py | 552 | 651 | +99 |
| engine.py | 1011 | 1052 | +41 |
| builder.py | 222 | 242 | +20 |
| prompts.py | 409 | 425 | +16 |
| credentials.py | 269 | 284 | +15 |
| config.py | 108 | 112 | +4 |
| __main__.py | 598 | 605 | +7 |
| **Total** | **7324** | **7809** | **+485** |

---

## How to Attribute

If you use this project, please:

1. **Mention both the authors** 
2. **Link to the original repo** in your README or CREDITS
3. **Respect the MIT license** from the original project
4. **List your contributions** (academic API integrations, rebrand to literature review, etc.)

Example README addition:

```markdown
## Credits

This project is adapted from [OpenPlanter](https://github.com/ShinMegamiBoson/OpenPlanter) 
by [ShinMegamiBoson](https://github.com/ShinMegamiBoson).

**Modifications by [HSajeed](https://github.com/HSajeed):**
- Rebrand for academic literature review workflows
- Added arXiv, Semantic Scholar, OpenAlex, and CrossRef integrations
- Updated system prompts and tool routing for academic research
- PDF extraction from academic sources
```

---

## License

Both original and modified work are licensed under the **MIT License**.  
See [LICENSE](LICENSE) for details.
