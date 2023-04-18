# GitHub Actions CI

I have created a
**[GitHub Actions](../../.github/workflows/api-tests.yml)**
workflow to run API tests automatically. The workflow is defined
in the `api-tests.yml` file in the `.github/workflows` directory.
This workflow runs every time there is a push or pull request to
the repository.

Workflow Runs can be seen in **[Actions](https://github.com/RyanairLabs/qa-api-challenge-murillowelsi/actions)** tab.

The workflow consists of the following steps:

1. Checkout the code from the repository.
2. Load a Docker image for the API testing service.
3. Start a Docker container for the API testing service.
4. Set up JDK 17 and Maven.
5. Build and run API tests using Maven.

In summary, this YAML file automates the process of running API tests by setting up a Docker container and building the tests with Maven, allowing developers to quickly and easily test their APIs.
