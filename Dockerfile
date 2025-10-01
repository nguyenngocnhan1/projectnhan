# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# Copy toàn bộ source
COPY . .

# Restore dependencies
RUN dotnet restore LearnKing.sln

# Publish ứng dụng
RUN dotnet publish LearnKing.Api/LearnKing.Api.csproj -c Release -o /app/publish /p:UseAppHost=false

# Stage 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
WORKDIR /app

COPY --from=build /app/publish .

ENV ASPNETCORE_URLS=http://+:86
EXPOSE 86

ENTRYPOINT ["dotnet", "LearnKing.Api.dll"]
