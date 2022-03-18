New-Variable -Name ids -Value (terraform output instance_ids)
# echo $ids

Write-Output "Starting all instances..."
foreach ($id in $ids.Split(" "))
{
  aws --profile nishant-infra.gen ec2 start-instances --instance-ids $id
}

Write-Output "Sleeping for some time for instances to come up..."
Start-Sleep 30

terraform apply -auto-approve