New-Variable -Name ids -Value (terraform output instance_ids)
# echo $ids

foreach ($id in $ids.Split(" "))
{
  aws --profile nishant-infra.gen ec2 stop-instances --instance-ids $id
}
