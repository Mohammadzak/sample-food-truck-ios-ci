# Use a Swift image compatible with your code
FROM swift:5.9

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Install SwiftLint from prebuilt binary
RUN curl -L https://github.com/realm/SwiftLint/releases/download/0.57.0/portable_swiftlint.zip -o swiftlint.zip \
    && unzip swiftlint.zip -d /usr/local/bin \
    && chmod +x /usr/local/bin/swiftlint \
    && rm swiftlint.zip

# Default command
CMD ["swiftlint", "--version"]
