#!/usr/bin/env sh 
set -e

if [ -n "$MODEL" ] && [ -z "$LLM_MODEL" ]; then
  export LLM_MODEL="$MODEL"
fi

echo $GEMINI_API_KEY

exec python -m llm_pr_review_agent.pr_llm_review "$@" 
