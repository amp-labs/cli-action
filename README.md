# Official Ampersand Github Action

This GitHub Action allows you to automate the deployment of [Ampersand](https://www.withampersand.com/) integrations directly from your GitHub workflows. It enables you to run the `amp deploy` CLI command in a CI/CD pipeline, making it easy for Ampersand customers to deploy their integrations automatically.

## Prerequisites

1. You must have an [Ampersand](https://dashboard.withampersand.com) account and an Ampersand project.
2. Set up an API key for your project. You can generate the API key from the [Ampersand dashboard](https://dashboard.withampersand.com/projects/_/api-keys). Be sure to select "Server or CLI" when prompted with "Where will you use the API key?"
3. Store your API key in GitHub Secrets (e.g. `AMP_API_KEY`).
4. Get your project ID from the [Ampersand dashboard](https://dashboard.withampersand.com/projects/_/settings) and store it in GitHub Secrets (e.g. `AMP_PROJECT_ID`).

## How to use the Github Action

### Add the Action to your Workflow

Add this action to your GitHub workflow by referencing it in your `.github/workflows/your-workflow.yml` file. 

Here's an example workflow that deploys an Ampersand integration when code is pushed to the main branch:

````yaml
name: Deploy Ampersand Integration

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v3

      - name: Deploy to Ampersand
        uses: amp-labs/cli-action@v1
        with:
          api_key: ${{ secrets.AMP_API_KEY }}
          project_id: ${{ secrets.AMP_PROJECT_ID }}
          directory_path: "path/to/integration/"    #  Path to a folder with the amp.yml file. If not provided, the action will use the root directory.


      # Add more steps here as needed

      ```
````
### Configure repository secrets

Make sure your GitHub repository has the necessary secrets to run the action. You can name these secrets anything you'd like, and reference them in your workflow file. For the example above, you will need to add these repository secrets:

1. `AMP_API_KEY`: Your API key for the Ampersand platform.
2. `AMP_PROJECT_ID`: The ID or name of the project you want to deploy.

### Deploying to multiple projects

You can deploy to multiple Ampersand projects within your workflow, here is [an example workflow](https://github.com/amp-labs/demo-hubspot-apollo/blob/main/.github/workflows/amp_deploy.yml) that deploys to a dev project when a commit is made in a PR, and deploys to a prod project when the PR is merged.

### Troubleshooting

1. If you encounter issues, ensure that the AMP_API_KEY and PROJECT_ID are correctly set in GitHub Secrets.
2. Make sure the directory path is specified correctly relative to the root of your repository.

