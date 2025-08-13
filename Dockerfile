FROM swift:5.10

# Install dependencies
RUN apt-get update && apt-get install -y curl tar gzip && rm -rf /var/lib/apt/lists/*

# Download and install SwiftLint for Linux directly
RUN curl -L https://github.com/realm/SwiftLint/releases/download/0.57.0/swiftlint_linux.zip -o swiftlint_linux.zip && \
    unzip swiftlint_linux.zip -d swiftlint && \
    mv swiftlint/swiftlint /usr/local/bin/ && \
    chmod +x /usr/local/bin/swiftlint && \
    rm -rf swiftlint_linux.zip swiftlint

# Default command
CMD ["swiftlint", "--version"]
