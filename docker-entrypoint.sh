#!/usr/bin/env sh 
set -e

if [ -n "$MODEL" ] && [ -z "$LLM_MODEL" ]; then
  export LLM_MODEL="$MODEL"
fi

export GITHUB_TOKEN="${INPUT_GITHUB_TOKEN:-${GITHUB_TOKEN}}"
export GEMINI_API_KEY="${INPUT_GEMINI_API_KEY:-${GEMINI_API_KEY}}"

echo "=== Environment Setup ==="
echo "Working Directory: $(pwd)"
echo "Python Path: $(which python)"
echo "Python Version: $(python --version)"
echo "Available modules:"

exec python -m llm_pr_review_agent.pr_llm_review "$@" 
