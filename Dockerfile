FROM mcr.microsoft.com/dotnet/sdk:5.0-focal AS build
WORKDIR /sln

ENV NODE_VERSION=14.17.0
RUN apt install -y curl
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN node --version
RUN npm --version

COPY . .

RUN dotnet restore
RUN dotnet publish Web -c Release -o /publish/web
RUN dotnet publish Auth -c Release -o /publish/auth
RUN dotnet publish Api -c Release -o /publish/api
