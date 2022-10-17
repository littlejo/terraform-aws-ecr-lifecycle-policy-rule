variable "priority" {
  description = "Specify a rule priority, which must be unique. Values do not need to be sequential across rules in a policy."
  type        = number
  default     = 1
}

variable "description" {
  description = "Specify a description for your lifecycle policy."
  type        = string
  default     = ""
}

variable "image_status" {
  description = "Indicates whether the image is tagged or not."
  type        = string
  default     = "tagged"
  validation {
    condition     = contains(["untagged", "tagged", "any"], var.image_status)
    error_message = "The image_status value must be untagged, tagged or any"
  }
}

variable "tag_prefixes" {
  description = "This parameter is only used if you specified image_status = 'tagged'. You must specify a comma-separated list of image tag prefixes to take action on with your lifecycle policy. For example, if your images are tagged as 'prod', 'prod1', 'prod2', etc you would use the tag prefix prod to specify all of them. If you specify multiple tags, only images with all specified tags will be selected."
  type        = list(string)
  default     = []
}

variable "match_criteria" {
  description = "Specify the count type to apply to the images (image_count_more_than or since_image_pushed) with a number (of images for image_count_more_than and days for since_image_pushed)"
  type = object({
    image_count_more_than = optional(number)
    since_image_pushed    = optional(number) #in Days
  })
}
