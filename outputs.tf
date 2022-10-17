output "policy_rule" {
  description = "ECR Policy Rule"
  value       = local.policy_rule
}

output "policy_rules_json" {
  description = "ECR Policy Rules json"
  value       = jsonencode({ rules = [local.policy_rule] })
}
