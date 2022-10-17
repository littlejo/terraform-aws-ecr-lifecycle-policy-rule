module "this" {
  source = "../../"

  priority    = 25
  description = "untagged"

  image_status = "untagged"
  match_criteria = {
    since_image_pushed = 60
  }
}

resource "aws_ecr_repository" "this" {
  name = "since_pushed_untagged"
}

resource "aws_ecr_lifecycle_policy" "this" {
  repository = aws_ecr_repository.this.name
  policy     = module.this.policy_rules_json
}

output "res" {
  value = module.this.policy_rule
}
