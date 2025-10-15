# show-db.ps1 - Show products table contents from the MySQL docker container
param(
    [string]$ContainerName = 'ecommerce-db',
    [string]$User = 'root',
    [string]$Password = 'Visala2006.',
    [string]$Database = 'ecommerce'
)

Write-Host "Querying container $ContainerName for table products..."
$query = 'SELECT id, name, category, price, image_path FROM ' + $Database + '.products;'
$cmd = "docker exec -i $ContainerName mysql -u$User -p`"$Password`" -e `"$query`""
Write-Host "Running: $cmd"
Invoke-Expression $cmd
