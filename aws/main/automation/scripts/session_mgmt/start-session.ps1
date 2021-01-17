New-Variable -Name ids -Value (terraform output instance_ids)
# echo $ids

echo "Starting all instances..."
foreach ($id in $ids.Split(" "))
{
  aws --color off ec2 start-instances --instance-ids $id
}

echo "Sleeping for some time for instances to come up"
Start-Sleep 30

terraform apply -auto-approve