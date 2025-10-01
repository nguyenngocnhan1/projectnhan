# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# Copy solution và các project
COPY *.sln ./
COPY LearnKing.Application/*.csproj ./LearnKing.Application/
COPY LearnKing.Common/*.csproj ./LearnKing.Common/
COPY LearnKing.Domain/*.csproj ./LearnKing.Domain/
COPY LearnKing.Infrastructure/*.csproj ./LearnKing.Infrastructure/
COPY LearnKing.Api/*.csproj ./LearnKing.Api/

# Restore dependencies
RUN dotnet restore

# Copy toàn bộ source code
COPY . .

# Publish ứng dụng
RUN dotnet publish LearnKing.Api/LearnKing.Api.csproj -c Release -o /app/publish /p:UseAppHost=false

# Stage 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
WORKDIR /app

# Copy kết quả build từ stage 1
COPY --from=build /app/publish .

# Config
ENV ASPNETCORE_URLS=http://+:86
EXPOSE 86

# Run app
ENTRYPOINT ["dotnet", "LearnKing.Api.dll"]
