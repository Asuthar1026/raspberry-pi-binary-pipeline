# raspberry-pi-binary-pipeline

This project demonstrates how to build and upload a binary for Raspberry Pi using Docker, GitHub Actions, and CI/CD tools. The pipeline involves building a Go binary inside a Docker container and uploading it to GitHub Releases.

## Cloning the Repository

1. Clone the repository to your local machine:

    ```bash
    git clone https://github.com/Asuthar1026/raspberry-pi-binary-pipeline.git
    cd raspberry-pi-binary-pipeline
    ```

## Environment Setup

Before running the pipeline, set up the necessary environment variables for interacting with the GitHub API.

1. **GitHub Token**: Generate a personal access token on GitHub with the `repo` and `public_repo` scopes.
   - Go to [GitHub Tokens](https://github.com/settings/tokens) to generate your token.
   - Store the token in a `.env` file or export it as an environment variable.

    

2. **Set GitHub Repository Details**:
   Edit the `docker-compose.yml` file and replace the placeholders with your GitHub username, repository, and the release version.

    ```yaml
    environment:
      GITHUB_TOKEN: ${GITHUB_TOKEN}
      OWNER: "Asuthar1026"                           
      REPO: "raspberry-pi-binary-pipeline"               
      TAG_NAME: "v1.0.0"               
      FILE_PATH: "/app/output-binary" 
    ```

## Building the Project

The project uses Go to build a binary for the Raspberry Pi. Follow these steps to build the project.


1 **Build the Docker Image**:
    The `Dockerfile` sets up a Go build environment. Run the following to build the Docker image:

    ```bash
    docker-compose up --build
    ```

    This command will:
    - Set up the `builder` service to compile the Go binary.
    - Generate the binary as `output-binary` in the `/app` directory inside the container.

## Uploading the Binary

Once the binary is built, you can upload it to GitHub Releases automatically using Docker Compose. The `uploader` service in `docker-compose.yml` handles this task.

1. The `uploader` service uploads the binary to GitHub using the GitHub API. The environment variables set earlier ensure the binary is uploaded to the correct release tag.

    ```bash
    docker-compose up
    ```

2. The binary will be uploaded to the GitHub release specified by the `TAG_NAME`.

## CI/CD with Docker Compose (Optional)

You can simulate the CI/CD pipeline locally using Docker Compose. This will build and upload the binary to GitHub.

1. **docker-compose.yml**: This file configures two services:
    - **Builder**: Builds the Go binary inside a Docker container.
    - **Uploader**: Uploads the generated binary to GitHub using the GitHub API.

    Ensure the `GITHUB_TOKEN` and other necessary variables are set in your `.env` file or your environment.

2. **Run the Pipeline**:

    ```bash
    docker-compose up --build
    ```

This will:
- Build the Go project in the `builder` container.
- Upload the binary to the specified GitHub release using the `uploader` container.


## Conclusion

With this setup, you can build and upload Go binaries to GitHub releases using Docker, GitHub Actions, and CI/CD tools. You can also simulate the CI/CD pipeline locally using Docker Compose. Let me know if you have any questions or run into issues!

