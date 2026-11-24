# Linux System Health Monitoring using Bash and GitHub Actions

## Project Overview

This project demonstrates basic Linux system health monitoring using a Bash script and automated Continuous Integration (CI) using GitHub Actions.

The Bash script collects basic system information and monitors CPU usage, memory usage, disk usage, and the running status of SSH and Apache processes.

GitHub Actions automatically validates and executes the Bash script whenever code is pushed to the repository or a pull request is created.

## Project Objectives

- Automate basic Linux system health monitoring.
- Practice Bash scripting using variables, conditions, `if`, `elif`, and `else`.
- Understand GitHub Actions and CI workflow automation.
- Validate Bash script syntax automatically.
- Execute the monitoring script on a GitHub-hosted Ubuntu runner.

## Technologies Used

- **Operating System:** Ubuntu Linux
- **Scripting Language:** Bash
- **Version Control:** Git and GitHub
- **CI/CD Tool:** GitHub Actions
- **Execution Environment:** GitHub-hosted Ubuntu runner

## Project Structure

```text
11-cicd-devops/
└── 01-github-actions-linux-monitoring/
    ├── scripts/
    │   └── system_health.sh
    └── README.md

Repository-level workflow:
.github/
└── workflows/
    └── 01-linux-monitoring-ci.yml
```

## Monitoring Features

| Component | Command | Purpose |
|---|---|---|
| Hostname | `hostname` | Displays system hostname |
| CPU | `top` | Displays CPU utilization |
| Memory | `free -h` | Displays memory usage |
| Disk | `df -h /` | Displays root filesystem usage |
| SSH | `pgrep -c sshd` | Checks SSH process count |
| Apache | `pgrep -c apache2` | Checks Apache process count |

The script uses conditional statements to report whether SSH and Apache processes are running.

## Bash Script Execution

Navigate to the project directory:

```bash
cd 11-cicd-devops/01-github-actions-linux-monitoring
```

Run the Bash syntax validation:

```bash
bash -n scripts/system_health.sh
```

Execute the monitoring script:

```bash
bash scripts/system_health.sh
```

## GitHub Actions CI Workflow

The GitHub Actions workflow is stored at the root of the portfolio repository:

`.github/workflows/01-linux-monitoring-ci.yml`

### Workflow Triggers

- **Push:** Automatically triggers the workflow when code is pushed.
- **Pull Request:** Automatically triggers the workflow when a pull request is created or updated.

### CI Pipeline Steps

1. Checkout repository – retrieves the repository source code.
2. Validate Bash script – executes `bash -n` to check script syntax.
3. Execute system monitoring – runs the Bash monitoring script on an Ubuntu runner.

### Workflow Execution Result

**Status: Successfully Completed**

- Workflow: Linux System Health Monitoring CI
- Run: #1
- Branch: `main`
- Commit: `5b11696`
- Result: Success

[View GitHub Actions Workflow Run](https://github.com/SravanBoosa/cloud-devops-multicloud-AWS-AZURE-python-ai-projects/actions/runs/45395469224)

## Key Learning Outcomes

- Writing Bash scripts using conditional statements.
- Monitoring Linux system resources using basic Linux commands.
- Understanding GitHub Actions workflows.
- Working with YAML configuration files.
- Configuring automated CI triggers.
- Validating and executing scripts on GitHub-hosted runners.
- Using Git commands to commit, synchronize and push project changes.

## Future Improvements

- Add CPU, memory and disk usage threshold-based alerts.
- Extend monitoring to additional Linux services.
- Integrate ShellCheck for static analysis.
- Publish monitoring reports as GitHub Actions artifacts.

---

**Author:** Sravan Kumar Boosa

**GitHub Portfolio:** https://github.com/SravanBoosa/cloud-devops-multicloud-AWS-AZURE-python-ai-projects
