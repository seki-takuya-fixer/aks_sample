param(
    [parameter(mandatory = $true)]
    [string]$SubscriptionId,
    [parameter(mandatory = $true)]
    [string]$ResourceGroupName,
    [parameter(mandatory = $true)]
    [string]$AksClusterName
)
$ErrorActionPreference = "Stop"

$subscriptionsJson = az account list
$subscriptions = $subscriptionsJson | ConvertFrom-Json
$subscription = $subscriptions | Where-Object { $_.id -eq "$SubscriptionId" }
if (!$subscription) {
    az login
}
az account set --subscription $SubscriptionId

az aks get-credentials --resource-group $ResourceGroupName --name $AksClusterName
