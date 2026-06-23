output "launch_template_id" {
  value = aws_launch_template.asg_lt.id
}

output "auto_scaling_group_id" {
  value = aws_autoscaling_group.asg.id
}

output "ebs_attach_policy_arn" {
  description = "ARN of the IAM policy for EBS volume attachment (only created when ebs_device is set)"
  value       = var.ebs_device == "" ? null : aws_iam_policy.ebs_attach_policy[0].arn
}
