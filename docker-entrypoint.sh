#!/usr/bin/env sh 
set -e

if [ -n "$MODEL" ] && [ -z "$LLM_MODEL" ]; then
  export LLM_MODEL="$MODEL"
fi

GITHUB_TOKEN=$(printenv "INPUT_GITHUB-TOKEN" || echo "")
GEMINI_API_KEY=$(printenv "INPUT_GEMINI-API-KEY" || echo "")

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
