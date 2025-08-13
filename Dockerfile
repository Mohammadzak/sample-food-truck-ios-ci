# Use the official Swift image
FROM swift:5.9

# Install SwiftLint
RUN apt-get update && apt-get install -y git curl && \
    git clone https://github.com/realm/SwiftLint.git && \
    cd SwiftLint && swift build -c release && \
    mv .build/release/swiftlint /usr/local/bin/ && \
    cd .. && rm -rf SwiftLint

# Set the working directory
WORKDIR /app

# Default command
CMD ["swiftlint"]
