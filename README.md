<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | Specify a description for your lifecycle policy. | `string` | `""` | no |
| <a name="input_image_status"></a> [image\_status](#input\_image\_status) | Indicates whether the image is tagged or not. | `string` | `"tagged"` | no |
| <a name="input_match_criteria"></a> [match\_criteria](#input\_match\_criteria) | Specify the count type to apply to the images (image\_count\_more\_than or since\_image\_pushed) with a number (of images for image\_count\_more\_than and days for since\_image\_pushed) | <pre>object({<br>    image_count_more_than = optional(number)<br>    since_image_pushed    = optional(number) #in Days<br>  })</pre> | n/a | yes |
| <a name="input_priority"></a> [priority](#input\_priority) | Specify a rule priority, which must be unique. Values do not need to be sequential across rules in a policy. | `number` | `1` | no |
| <a name="input_tag_prefixes"></a> [tag\_prefixes](#input\_tag\_prefixes) | This parameter is only used if you specified image\_status = 'tagged'. You must specify a comma-separated list of image tag prefixes to take action on with your lifecycle policy. For example, if your images are tagged as 'prod', 'prod1', 'prod2', etc you would use the tag prefix prod to specify all of them. If you specify multiple tags, only images with all specified tags will be selected. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy_rule"></a> [policy\_rule](#output\_policy\_rule) | ECR Policy Rule |
| <a name="output_policy_rules_json"></a> [policy\_rules\_json](#output\_policy\_rules\_json) | ECR Policy Rules json |
<!-- END_TF_DOCS -->