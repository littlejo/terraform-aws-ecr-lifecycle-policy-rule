module "this" {
  source = "../../"

  priority    = 10
  description = "tagged prefixes (test, uat and prod)"

  image_status = "tagged"
  tag_prefixes = ["test", "uat", "prod"]
  match_criteria = {
    since_image_pushed = 30
  }
}

resource "aws_ecr_repository" "this" {
  name = "since_pushed_tagged"
}

resource "aws_ecr_lifecycle_policy" "this" {
  repository = aws_ecr_repository.this.name
  policy     = module.this.policy_rules_json
}

output "res" {
  value = module.this.policy_rule
}
