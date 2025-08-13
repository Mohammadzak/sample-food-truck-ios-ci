# Use a Swift base image compatible with your project
FROM swift:5.10

# Install minimal dependencies
RUN apt-get update && apt-get install -y curl unzip && rm -rf /var/lib/apt/lists/*

# Download SwiftLint's multi-platform binary bundle
RUN curl -L https://github.com/realm/SwiftLint/releases/download/0.58.0/SwiftLintBinary.artifactbundle.zip \
    -o swiftlint.zip && \
    unzip swiftlint.zip && \
    mv SwiftLintBinary_Linux/swiftlint /usr/local/bin/swiftlint && \
    chmod +x /usr/local/bin/swiftlint && \
    rm -rf swiftlint.zip SwiftLintBinary_Linux SwiftLintBinary_macos

# Default command to check version
CMD ["swiftlint", "--version"]
