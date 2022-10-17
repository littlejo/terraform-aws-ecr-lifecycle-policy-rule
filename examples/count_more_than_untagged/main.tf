module "this" {
  source = "../../"

  priority    = 18
  description = "untagged"

  image_status = "any"
  match_criteria = {
    image_count_more_than = 26
  }
}

resource "aws_ecr_repository" "this" {
  name = "count_more_than_untagged"
}

resource "aws_ecr_lifecycle_policy" "this" {
  repository = aws_ecr_repository.this.name
  policy     = module.this.policy_rules_json
}

output "res" {
  value = module.this.policy_rule
}
