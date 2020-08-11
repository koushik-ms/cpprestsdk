#!/bin/bash

echo 'curl -OL https://github.com/github/codeql-cli-binaries/releases/download/v2.2.4/codeql-linux64.zip'
curl -OL https://github.com/github/codeql-cli-binaries/releases/download/v2.2.4/codeql-linux64.zip

echo '7z x codeql-linux64.zip -o/opt -r'
7z x codeql-linux64.zip -o/opt -r

# Now codeql is available at /opt/codeql/codeql
echo "Creating database: "
rm -rf build.debug
/opt/codeql/codeql database create /tmp/cpprestsdk-db --language=cpp --command=".github/workflows/scripts/build.sh"
