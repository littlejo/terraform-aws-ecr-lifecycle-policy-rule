locals {
  policies = {
    rules = [module.this.policy_rule, module.this2.policy_rule]
  }
  policies_json = jsonencode(local.policies)
}

module "this" {
  source = "../../"

  priority    = 18
  description = "tagged prefixes (test, uat and prod)"

  image_status = "tagged"
  tag_prefixes = ["test", "uat", "prod"]
  match_criteria = {
    image_count_more_than = 42
  }
}

module "this2" {
  source = "../../"

  priority    = 25
  description = "untagged"

  image_status = "untagged"
  match_criteria = {
    since_image_pushed = 22
  }
}

resource "aws_ecr_repository" "this" {
  name = "some_rules"
}

resource "aws_ecr_lifecycle_policy" "this" {
  repository = aws_ecr_repository.this.name
  policy     = local.policies_json
}

output "res" {
  value = local.policies
}
