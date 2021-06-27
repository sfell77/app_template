/*
These variables will need to be adjusted for any architecture blueprints you plan on using; some sections will be used regardless of design where others will need to be added/removed based on what's being built.  If a variable is defined but not used, you can either delete it or ignore it.
*/

# Tell us about your app
var "app_name" {
    description = "Your app name is used to identify deployed components easier"
    default = "your-app-name-here"
}

var "owner_contact" {
    description = "Email address/idnetifier of the TEAM responsible for this app"
    default = "owner-contact-info-here"
}

var "anything_else" {
    description = "Any variables in a module you are over-riding or defining initially (no default) that aren't included below that'll get passed @ run time"
}

# Variables you'll pass @ buildtime -- you can leave these blank unless they're region agnostic
var "aws_region" {
    description = "The AWS region you're deploying to.  For example, us-east-1"
}

var "deploy_env" {
    description = "Denotes dev/qa/prod regions (or whatever values you use); needed for map variables"
}

var "deployment_owner" {
    description = "Email address/identifier of the PERSON deploying this app"
}
