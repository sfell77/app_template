# app_template
Terraform application template for use in conjunction with other modules

## How to use
**DO NOT MODIFY THIS REPO (or try -- I'll reject all your PRs!)**

Clone this repo for *each* application you need to deploy and save changes THERE.  Each application should have its own repo to reduce the likelihood of accidental/unplanned changes and to limit cross-contamination of tools or SCM conflicts.

## How to *really* use
In each **module** you invoke through your application, the variables located in the `variables.tf` file in that module's repo must be provided in your application's `variables.tf` file.  If you are using multiple modules, you will have duplicate variable names -- these can be consolidated to a single variable as we use consistent configurations across modules!  Hooray!
