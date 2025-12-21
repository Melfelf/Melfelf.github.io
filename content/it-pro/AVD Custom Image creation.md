+++
title = "AVD Custom Image creation"
date = 2025-06-08T13:45:00+02:00
updated = 2025-06-08T13:45:00+02:00
description = "Automated process for creating and maintaining custom images for Azure Virtual Desktop using Azure Image Builder with multi-environment support."
keywords = ["Azure", "AVD", "Azure Virtual Desktop", "Image Builder", "Automation", "Infrastructure"]

[extra]
reading_time = 8
+++

## Concept: Automated Custom Image Creation for AVD

### Objective

We implemented an automated process for creating and maintaining custom images for Azure Virtual Desktop (AVD) using Azure Image Builder. The solution supports multiple environments and client types through a configuration-based approach, ensuring consistent and optimized image deployment across the organization.

### Key Features

- **Multi-Environment Support:** Single image build process supporting multiple environments and client types
- **Automation:** Fully automated image creation through pipeline integration
- **Configuration Management:** Uses configuration files for flexible environment-specific settings
- **Identity Management:** Specifically designed for Intune-managed AAD-only clients
- **Image Optimization:** Includes automated cleanup and optimization procedures
- **Post-Deployment:** Automated post-setup tasks after deployment

### Solution Overview

The solution encompasses the following key components and steps:

1. **Image Configuration Setup:**
   - Implementation of environment-specific configuration files
   Configuration files control which software should be installed in each image. These configuration files can also be used for additional specific configurations.
   The configuration files are selected and applied based on the image template names.
   - Setting of registry keys for client identification
   Identification parameters such as environment, stage, build date, template name and other details are stored as registry keys.

   - Configuration of environment-specific settings
   Settings can be configured individually depending on the stage or environment. The identification is done using the registry keys mentioned above.

2. **Software Management:**
   - Automated software package download
   - Silent installation procedures
   - Environment-specific application deployment

3. **Image Optimization:**
   - Removal of unnecessary components (Bloatware)
   - System optimization for AVD workloads
   - Implementation of best practices for image management

4. **Automation Pipeline:**
   - Integration with CI/CD pipelines
   - Automated triggering of new image builds
   - Version control and image management

5. **Post-Deployment Configuration:**
   - Automated post-setup script execution
   - AAD tenant join procedures
   - Client status tagging and validation

6. **Monitoring and Validation:**
   - Deployment status tracking
   - Client self-tagging verification
   - Success criteria validation