FROM debian:bullseye-slim

# Install dependencies
RUN apt-get update && apt-get install -y curl unzip

# Download Ampersand CLI
RUN curl -fsSL https://github.com/amp-labs/cli/releases/download/v1.0.7/ampersand-cli_1.0.7+git-1_amd64.deb -o ampersand-cli.deb

# Install Ampersand CLI
RUN dpkg -i ampersand-cli.deb || apt-get install -f -y && rm ampersand-cli.deb

# set PATH
ENV PATH="/usr/local/ampersand-cli/bin:${PATH}"

# Set the entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
