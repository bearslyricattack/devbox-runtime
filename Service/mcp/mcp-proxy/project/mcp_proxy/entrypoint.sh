#!/bin/bash

app_env=${1:-development}

# ※To use pip, parameters need to be added: --break-system-packages
. .venv/bin/activate
# Activate virtual environment

# Development environment commands
dev_commands() {
    echo "Running development environment commands..."
    # In the development environment, we may need more debugging information
    python __main__.py --sse-port=8080 npx @modelcontextprotocol/server-puppeteer
}

# Production environment commands
prod_commands() {
    echo "Running production environment commands..."
    # In the production environment, we may need to add other parameters
    python __main__.py --sse-port=8080 npx @modelcontextprotocol/server-puppeteer

# Check environment variables to determine the running environment
if [ "$app_env" = "production" ] || [ "$app_env" = "prod" ] ; then
    echo "Production environment detected"
    prod_commands
else
    echo "Development environment detected"
    dev_commands
fi