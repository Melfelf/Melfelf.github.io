+++
title = "AVD Rolling Hostpool Update"
date = 2025-06-07T15:20:00
updated = 2025-06-07T15:20:00
reading_time = 9
description = "Strategy for updating Azure Virtual Desktop hostpools with minimal downtime using rolling updates and session host management."
keywords = ["Azure", "AVD", "rolling updates", "hostpool management", "infrastructure"]
+++

## Concept: Automated Rolling Updates for AVD Hostpools

### Objective

Design and implement a fully automated process for updating (redeploying) all session hosts within an Azure Virtual Desktop (AVD) hostpool. The solution must support scheduled (daily, weekly, monthly) and on-demand updates, operate without manual intervention, and ensure minimal disruption to end users by gracefully draining active sessions.

### Key Requirements

- **Automation:** The update process is entirely automated, requiring no manual interaction.
- **Flexible Scheduling:** Updates can be triggered on a regular schedule or on demand.
- **User Session Management:** Active user sessions are drained with a configurable grace period to prevent abrupt disconnections.
- **Image and Disk Management:** Session hosts are deployed from a custom image and provisioned to ephemeral disks for optimal performance and security.
- **Disaster Recovery:** Fixed disk session hosts are maintained for non-24/7 scenarios, serving as disaster recovery backups and supporting VM hibernation for cost efficiency.

### Solution Overview

The solution involves the following key components and steps:

1. **Custom Image Creation:** Develop a custom image containing the necessary applications and configurations for the session hosts.
2. **Hostpool Configuration:** Set up an AVD hostpool with the desired number of session hosts, using the custom image for deployment.
3. **Ephemeral Disk Provisioning:** Configure session hosts to use ephemeral disks, ensuring fast and secure temporary storage.
4. **Automation Script Development:** Create scripts to automate the update process, including session host redeployment and user session management.
5. **Scheduled Tasks:** Configure Azure Automation or similar services to trigger the update scripts based on the defined schedule (daily, weekly, monthly).
6. **On-Demand Update Mechanism:** Implement a method for manually triggering updates when immediate action is required.
7. **Monitoring and Alerts:** Set up monitoring for the update process, with alerts for any failures or issues that require attention.

