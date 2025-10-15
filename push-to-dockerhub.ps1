param(
    [string]$DockerHubUser = $(Read-Host 'Docker Hub username'),
    [switch]$PushOnly
)

if (-not $DockerHubUser) {
    Write-Error "Docker Hub username is required"
    exit 1
}

Write-Host "Logging into Docker Hub..."
docker login

$backendImage = "$DockerHubUser/ecommerce-backend:latest"
$frontendImage = "$DockerHubUser/ecommerce-frontend:latest"

if (-not $PushOnly) {
    Write-Host "Building backend image..."
    docker build -t $backendImage .\docker-ecommerce-backend

    Write-Host "Building frontend image..."
    docker build -t $frontendImage .\docker-ecommerce-frontend
}

Write-Host "Pushing backend image: $backendImage"
docker push $backendImage

Write-Host "Pushing frontend image: $frontendImage"
docker push $frontendImage

Write-Host "Updating docker-compose.prod.yml with your Docker Hub username..."
(Get-Content .\docker-compose.prod.yml) -replace 'REPLACE_WITH_YOUR_DOCKERHUB_USERNAME', $DockerHubUser | Set-Content .\docker-compose.prod.yml

Write-Host "Deploying stack with docker-compose.prod.yml"
docker-compose -f .\docker-compose.prod.yml up -d --build

Write-Host "Done. Backend should be available at http://localhost:8085 and frontend at http://localhost:3000"
