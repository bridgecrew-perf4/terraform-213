New-Variable -Name ids -Value (terraform output instance_ids)
# echo $ids

foreach ($id in $ids.Split(" "))
{
  aws --color off ec2 stop-instances --instance-ids $id
}
