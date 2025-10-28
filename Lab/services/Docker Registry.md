---
management_url: http://192.168.42.16/
tags:
  - docker
  - orchestration
  - automation
  - ci/cd
  - deployment
  - lab
Documentation: https://docs.docker.com/get-started/docker-concepts/the-basics/what-is-a-registry/
aliases:
---
A Docker registry is a centralized storage and distribution system for Docker images. It acts as a server-side application that stores, manages, and distributes container images across environments. 

Key characteristics and functions of a Docker Registry:
- [**Centralized Storage:**](https://www.google.com/search?num=10&newwindow=1&sca_esv=fe06bbe1a7ea018c&cs=1&sxsrf=AE3TifMgpE6cLeqMIMmydEK0Tg5X-Afo9A%3A1761637244937&q=Centralized+Storage&sa=X&ved=2ahUKEwiN6IaRssaQAxUGFDQIHadcFpAQxccNegQIEhAD&mstk=AUtExfAYVWTf2VU_c_4C-PQ2Jt0g9BTu_gDI2_IeDb_GQXSjUxsUKZkHPRg1eY_GCUwwnvYZrGZjmTOy62WTfmLfpN4nT1BSO8uZtSQPuavAjJvwFG-0xj7B0mNEjWB2eupqnsbSKKJP4bBFfHI5KeWhhx5D0BL9GCxMj9ORBYM5YkWKQeNMobjMfpjzk7K9Fd3w9GUrGiXx5EzQ61xoAWkMERs0jMTaXMMfC4ZExAAhBYzYJu_NLhBc2r8eSm80t-hcrRGNj-I90BA-xTOCdZRy_HOb&csui=3) 
    Provides a single location to store all Docker images, facilitating easier management and organization.
- [**Image Management:**](https://www.google.com/search?num=10&newwindow=1&sca_esv=fe06bbe1a7ea018c&cs=1&sxsrf=AE3TifMgpE6cLeqMIMmydEK0Tg5X-Afo9A%3A1761637244937&q=Image+Management&sa=X&ved=2ahUKEwiN6IaRssaQAxUGFDQIHadcFpAQxccNegQIFBAD&mstk=AUtExfAYVWTf2VU_c_4C-PQ2Jt0g9BTu_gDI2_IeDb_GQXSjUxsUKZkHPRg1eY_GCUwwnvYZrGZjmTOy62WTfmLfpN4nT1BSO8uZtSQPuavAjJvwFG-0xj7B0mNEjWB2eupqnsbSKKJP4bBFfHI5KeWhhx5D0BL9GCxMj9ORBYM5YkWKQeNMobjMfpjzk7K9Fd3w9GUrGiXx5EzQ61xoAWkMERs0jMTaXMMfC4ZExAAhBYzYJu_NLhBc2r8eSm80t-hcrRGNj-I90BA-xTOCdZRy_HOb&csui=3) 
    Organizes images into repositories, where each repository contains multiple versions (identified by tags) of a specific image.
- [**Distribution:**](https://www.google.com/search?num=10&newwindow=1&sca_esv=fe06bbe1a7ea018c&cs=1&sxsrf=AE3TifMgpE6cLeqMIMmydEK0Tg5X-Afo9A%3A1761637244937&q=Distribution&sa=X&ved=2ahUKEwiN6IaRssaQAxUGFDQIHadcFpAQxccNegQIHxAD&mstk=AUtExfAYVWTf2VU_c_4C-PQ2Jt0g9BTu_gDI2_IeDb_GQXSjUxsUKZkHPRg1eY_GCUwwnvYZrGZjmTOy62WTfmLfpN4nT1BSO8uZtSQPuavAjJvwFG-0xj7B0mNEjWB2eupqnsbSKKJP4bBFfHI5KeWhhx5D0BL9GCxMj9ORBYM5YkWKQeNMobjMfpjzk7K9Fd3w9GUrGiXx5EzQ61xoAWkMERs0jMTaXMMfC4ZExAAhBYzYJu_NLhBc2r8eSm80t-hcrRGNj-I90BA-xTOCdZRy_HOb&csui=3) 
    Allows users to "pull" (download) images to their local Docker environment and "push" (upload) new or updated images to the registry.
- [**Version Control:**](https://www.google.com/search?num=10&newwindow=1&sca_esv=fe06bbe1a7ea018c&cs=1&sxsrf=AE3TifMgpE6cLeqMIMmydEK0Tg5X-Afo9A%3A1761637244937&q=Version+Control&sa=X&ved=2ahUKEwiN6IaRssaQAxUGFDQIHadcFpAQxccNegQIFRAD&mstk=AUtExfAYVWTf2VU_c_4C-PQ2Jt0g9BTu_gDI2_IeDb_GQXSjUxsUKZkHPRg1eY_GCUwwnvYZrGZjmTOy62WTfmLfpN4nT1BSO8uZtSQPuavAjJvwFG-0xj7B0mNEjWB2eupqnsbSKKJP4bBFfHI5KeWhhx5D0BL9GCxMj9ORBYM5YkWKQeNMobjMfpjzk7K9Fd3w9GUrGiXx5EzQ61xoAWkMERs0jMTaXMMfC4ZExAAhBYzYJu_NLhBc2r8eSm80t-hcrRGNj-I90BA-xTOCdZRy_HOb&csui=3) 
    Enables tracking and managing different versions of an image through the use of tags, ensuring consistency and reproducibility.
- [**Access Control:**](https://www.google.com/search?num=10&newwindow=1&sca_esv=fe06bbe1a7ea018c&cs=1&sxsrf=AE3TifMgpE6cLeqMIMmydEK0Tg5X-Afo9A%3A1761637244937&q=Access+Control&sa=X&ved=2ahUKEwiN6IaRssaQAxUGFDQIHadcFpAQxccNegQIGBAD&mstk=AUtExfAYVWTf2VU_c_4C-PQ2Jt0g9BTu_gDI2_IeDb_GQXSjUxsUKZkHPRg1eY_GCUwwnvYZrGZjmTOy62WTfmLfpN4nT1BSO8uZtSQPuavAjJvwFG-0xj7B0mNEjWB2eupqnsbSKKJP4bBFfHI5KeWhhx5D0BL9GCxMj9ORBYM5YkWKQeNMobjMfpjzk7K9Fd3w9GUrGiXx5EzQ61xoAWkMERs0jMTaXMMfC4ZExAAhBYzYJu_NLhBc2r8eSm80t-hcrRGNj-I90BA-xTOCdZRy_HOb&csui=3) 
    Many registries offer features to manage who can access, pull, or push images, enhancing security and collaboration within teams.
- [**Integration with CI/CD:**](https://www.google.com/search?num=10&newwindow=1&sca_esv=fe06bbe1a7ea018c&cs=1&sxsrf=AE3TifMgpE6cLeqMIMmydEK0Tg5X-Afo9A%3A1761637244937&q=Integration+with+CI%2FCD&sa=X&ved=2ahUKEwiN6IaRssaQAxUGFDQIHadcFpAQxccNegQIHRAD&mstk=AUtExfAYVWTf2VU_c_4C-PQ2Jt0g9BTu_gDI2_IeDb_GQXSjUxsUKZkHPRg1eY_GCUwwnvYZrGZjmTOy62WTfmLfpN4nT1BSO8uZtSQPuavAjJvwFG-0xj7B0mNEjWB2eupqnsbSKKJP4bBFfHI5KeWhhx5D0BL9GCxMj9ORBYM5YkWKQeNMobjMfpjzk7K9Fd3w9GUrGiXx5EzQ61xoAWkMERs0jMTaXMMfC4ZExAAhBYzYJu_NLhBc2r8eSm80t-hcrRGNj-I90BA-xTOCdZRy_HOb&csui=3) 
    Plays a crucial role in Continuous Integration and Continuous Delivery (CI/CD) pipelines by providing a source for images during automated deployments.

Examples of Docker Registries:
- **Docker Hub:** 
    The official cloud-based public registry provided by Docker Inc., and the default registry for Docker commands.
- **Private Registries:** 
    Organizations can host their own private registries, either on-premises or using cloud-based services like:
    - Amazon Elastic Container Registry (ECR)
    - Azure Container Registry (ACR)
    - Google Artifact Registry (GAR)
    - GitHub Package Registry 
- On-Prem Registries:
	- [Registry UI](https://github.com/Joxit/docker-registry-ui) and [Docker-Registry](https://hub.docker.com/_/registry)

In essence, a Docker registry is an essential component in the containerization workflow, streamlining the deployment, management, and sharing of applications packaged as Docker images.