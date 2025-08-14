#!/usr/bin/env sh 
set -e

if [ -n "$MODEL" ] && [ -z "$LLM_MODEL" ]; then
  export LLM_MODEL="$MODEL"
fi

export GITHUB_TOKEN="${INPUT_GITHUB_TOKEN:-${GITHUB_TOKEN}}"
export GEMINI_API_KEY="${INPUT_GEMINI_API_KEY:-${GEMINI_API_KEY}}"

if [ -z "$GITHUB_TOKEN" ]; then
    echo "Error: GITHUB_TOKEN is required"
    echo "Available INPUT variables:"
    env | grep INPUT_ || echo "No INPUT_ variables found"
    exit 1
fi

if [ -z "$GEMINI_API_KEY" ]; then
    echo "Error: GEMINI_API_KEY is required"
    exit 1
fi


cd /app
exec python -m llm_pr_review_agent.pr_llm_review "$@" 
