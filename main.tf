locals {
  selection_since_image_pushed_tagged = {
    tagStatus     = var.image_status
    tagPrefixList = var.tag_prefixes
    countType     = "sinceImagePushed"
    countNumber   = var.match_criteria.since_image_pushed
    countUnit     = "days"
  }

  selection_since_image_pushed_untagged = {
    tagStatus   = var.image_status
    countType   = "sinceImagePushed"
    countNumber = var.match_criteria.since_image_pushed
    countUnit   = "days"
  }

  selection_image_count_more_than_tagged = {
    tagStatus     = var.image_status
    tagPrefixList = var.tag_prefixes
    countType     = "imageCountMoreThan"
    countNumber   = var.match_criteria.image_count_more_than
  }

  selection_image_count_more_than_untagged = {
    tagStatus   = var.image_status
    countType   = "imageCountMoreThan"
    countNumber = var.match_criteria.image_count_more_than
  }

  image_count = var.match_criteria.image_count_more_than == null ? false : true

  selection = var.image_status == "tagged" ? local.image_count ? "image_count_more_than_tagged" : "since_image_pushed_tagged" : local.image_count ? "image_count_more_than_untagged" : "since_image_pushed_untagged"

  policy_rules = {
    since_image_pushed_tagged = {
      rulePriority = var.priority
      description  = var.description

      selection = local.selection_since_image_pushed_tagged

      action = {
        type = "expire"
      }
    }
    since_image_pushed_untagged = {
      rulePriority = var.priority
      description  = var.description

      selection = local.selection_since_image_pushed_untagged

      action = {
        type = "expire"
      }
    }
    image_count_more_than_tagged = {
      rulePriority = var.priority
      description  = var.description

      selection = local.selection_image_count_more_than_tagged

      action = {
        type = "expire"
      }
    }
    image_count_more_than_untagged = {
      rulePriority = var.priority
      description  = var.description

      selection = local.selection_image_count_more_than_untagged

      action = {
        type = "expire"
      }
    }
  }

  policy_rule = local.policy_rules[local.selection]
}
