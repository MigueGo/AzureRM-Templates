﻿$resourceGroupName = 'migmimadfs16'
$azurecontext = $null
$azurecontext = Get-AzureRmContext -ErrorAction SilentlyContinue
if ($azurecontext -eq $null -or $azurecontext.Account -eq $null) {
    Login-AzureRmAccount
    $azurecontext = Get-AzureRmContext -ErrorAction SilentlyContinue
}
if ($azurecontext -eq $null -or $azurecontext.Account -eq $null){ 
    Write-Host "Unable to get a valid context." -ForegroundColor Red
    return
}

function Stop-VMs()
{
    Write-Output "Stopping SP..."
    Stop-AzureRmVM -ResourceGroupName $resourceGroupName -Name "SP" -Force
     Write-Output "Stopping MIM..."
    Stop-AzureRmVM -ResourceGroupName $resourceGroupName -Name "MIM" -Force
    Write-Output "Stopping SQL..."
    Stop-AzureRmVM -ResourceGroupName $resourceGroupName -Name "SQL" -Force
    Write-Output "Stopping DC..."
    Stop-AzureRmVM -ResourceGroupName $resourceGroupName -Name "DC" -Force

}

function Start-VMs()
{
    Write-Output "Starting DC..."
    Start-AzureRmVM -ResourceGroupName $resourceGroupName -Name "DC"
    Write-Output "Starting SQL..."
    Start-AzureRmVM -ResourceGroupName $resourceGroupName -Name "SQL"
    Write-Output "Starting SP..."
    Start-AzureRmVM -ResourceGroupName $resourceGroupName -Name "SP"
    Write-Output "Starting MIM..."
    Start-AzureRmVM -ResourceGroupName $resourceGroupName -Name "MIM"
}
