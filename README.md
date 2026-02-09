# Code-Assistant-Agent

A multi-agent code assistant that can explain, refactor, and document Python code. An orchestrator routes natural language requests to the appropriate agent.

## Agents

- **Code Explainer** - breaks down what code does in plain English
- **Code Refactor** - improves code structure, readability, and performance
- **Code Documentation** - adds docstrings and inline comments (Google, NumPy, Sphinx, or PEP 257 style)

## Setup

### Prerequisites

- Python 3.10+
- An Azure OpenAI deployment with API access

1. Clone the repo and `cd` into it.
2. Run the setup script for your platform:

**Windows:**
```
setup.bat
```

**macOS / Linux:**
```bash
chmod +x setup.sh
./setup.sh
source venv/bin/activate
```

3. Open the generated `.env` file and fill in your Azure OpenAI credentials.

### Configuration

`config.json` holds default settings for the model deployment, API version, and agent parameters. Environment variables in `.env` take precedence over config values for secrets (endpoint, API key).

## Usage

Run the demo:

```bash
python -m code_assistant.demo
```

## Project Structure

```
code_assistant/
    __init__.py
    orchestrator.py
    code_explainer_agent.py
    code_refactor_agent.py
    code_documentation_agent.py
    demo.py
.env.sample
config.json
requirements.txt
setup.bat
setup.sh
```