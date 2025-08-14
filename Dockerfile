# syntax=docker/dockerfile:1
FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# System deps
RUN apt-get update -y && apt-get install -y --no-install-recommends \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install Python deps
RUN pip install --no-cache-dir \
    httpx==0.27.0 \
    PyGithub==2.4.0 \
    pydantic==2.7.1 \
    requests==2.32.3

# Copy source
COPY llm_pr_review_agent /app/llm_pr_review_agent
COPY action.yml /app/action.yml
COPY docker-entrypoint.sh /app/docker-entrypoint.sh
RUN chmod +x /app/docker-entrypoint.sh

# Default envs expected at runtime:
# - GEMINI_API_KEY
# - GITHUB_TOKEN
# - LLM_TEMPERATURE (optional)
# - MAX_RESPONSE_TOKENS (optional)
# - REVIEW_CONTEXT_BYTES (optional)

ENTRYPOINT ["/app/docker-entrypoint.sh"] 
