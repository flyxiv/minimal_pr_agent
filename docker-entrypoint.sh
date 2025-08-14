#!/usr/bin/env sh 
set -e

if [ -n "$MODEL" ] && [ -z "$LLM_MODEL" ]; then
  export LLM_MODEL="$MODEL"
fi

export GITHUB_TOKEN="${INPUT_GITHUB_TOKEN:-${GITHUB_TOKEN}}"
export GEMINI_API_KEY="${INPUT_GEMINI_API_KEY:-${GEMINI_API_KEY}}"

exec python -m llm_pr_review_agent.pr_llm_review "$@" 
