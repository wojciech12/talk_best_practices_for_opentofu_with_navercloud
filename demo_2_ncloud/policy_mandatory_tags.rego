package main

required_tags := {"Name", "env", "owner"}

deny[msg] {
	some rs
	resources := input.resource_changes[rs]

	some tg
	tags := resources.change.after.tag_list[tg].tag_key

	missing_tags := {tag | required_tags[tag]; not tags[tag]}

	msg = sprintf("resource %q does not have all suggested tags (%s)", [resources.address, concat(", ", missing_tags)])

	count(missing_tags) > 0
}