amp-github-action
GitHub Action for deploying Ampersand integrations

This GitHub Action allows you to automate the deployment of Ampersand integrations directly from your GitHub workflows. It enables you to run the amp deploy command in a CI/CD pipeline, making it easy for Ampersand customers to deploy their integrations automatically.

## Prerequisites

1. You must have an [Ampersand](https://dashboard.withampersand.com) account and an Ampersand project.
2. Set up an API key for your project. You can generate the API key from the [Ampersand dashboard](https://dashboard.withampersand.com/projects/_/api-keys). Be sure to select "Server or CLI" when prompted with "Where will you use the API key?"
3. Store your API key in GitHub Secrets (e.g., `AMP_API_KEY`).
4. Get your project ID from the [Ampersand dashboard](https://dashboard.withampersand.com/projects/_/settings) and store it in GitHub Secrets (e.g., `AMP_PROJECT_ID`).

## How to use the Github Action

### Step 1: Add the Action to Your Workflow

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
        uses: amp-labs/amp-action@main
        with:
          API_key: ${{ secrets.AMP_API_KEY }}
          PROJECT_ID: ${{ secrets.AMP_PROJECT_ID }}
          DIRECTORY_PATH: "path/to/integration/"    #  Path to the amp.yml file. If not provided, the action will look for the amp.yml file in the root directory.


      # Add more steps here as needed

      ```
````
### Step 2: Configure Your Workflow
Make sure your GitHub repository has the necessary secrets and configuration to run the action.

1. AMP_API_KEY: Your API key for the Ampersand platform. Store it in GitHub Secrets.
2. PROJECT_ID: The ID of the project you want to deploy.
3. DIRECTORY_PATH: The path to the directory containing the `amp.yml` file. If not provided, the action will look for the `amp.yml` file in the root directory. 


### Troubleshooting

1. If you encounter issues, ensure that the AMP_API_KEY and PROJECT_ID are correctly set in GitHub Secrets.
2. Make sure the directory path is specified correctly relative to the root of your repository.

