# Use a Swift version compatible with your code
FROM swift:5.9

# Install dependencies and SwiftLint via Homebrew
RUN apt-get update && apt-get install -y git curl unzip && \
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash && \
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" && \
    brew install swiftlint && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set Homebrew path
ENV PATH="/home/linuxbrew/.linuxbrew/bin:${PATH}"

# Default command
CMD ["swiftlint", "--version"]
