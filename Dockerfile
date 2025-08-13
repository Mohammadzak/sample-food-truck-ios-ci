FROM swift:5.9

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    tar \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Install SwiftLint for Linux
RUN curl -L https://github.com/realm/SwiftLint/releases/download/0.57.0/swiftlint_linux.tar.gz -o swiftlint.tar.gz \
    && tar -xzf swiftlint.tar.gz \
    && mv swiftlint /usr/local/bin/ \
    && chmod +x /usr/local/bin/swiftlint \
    && rm swiftlint.tar.gz

CMD ["swiftlint", "--version"]
