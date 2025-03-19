# Resource-Scheduler
# Resource Scheduler project for CSC 2101 
# Operating Systems Task 2 assignment.


This is A PHP 8.2 project that optimizes the allocation of bank tellers to customer requests. The system minimizes wait times, maximizes resource utilization, and ensures fair task distribution using scheduling algorithms.

# Features
- User Authentication – Secure login for bank managers
- Teller Scheduling Algorithms – Round Robin, Priority Scheduling, Shortest Job Next
- Performance Analytics – Wait time, Teller utilization rate
- Email Notifications – Customers & Tellers receive notifications
- Containerization & CI/CD – Docker support with GitHub Actions

# Installation Guide
1. Prerequisites
- PHP 8.2
- MySQL
- XAMPP / Apache Server
- Composer (for dependencies)
- Docker (optional for containerization)

2. Database Setup
- Open phpMyAdmin and create a database
- Import the provided queuing_system.sql file or run

3. Installing Dependencies
Navigate to the project directory

4. Running the Project
- Start XAMPP (Apache & MySQL).
- Place the project inside htdocs:
- Open in browser and run on the localhost/queuing

# Usage
Login as a Bank teller
Enter LOGIN credentials:
Username: 
Password: 



# Docker Support
To run the project in a Docker container:
- Build the Docker Image: 'docker build -t queuing .'
- Run the Container: 'docker run -p 8080:80 bank_scheduler'
- Access the project at: http://localhost:8080


# CI/CD (GitHub Actions)
- Automated testing & deployment workflow:
- On push: Builds & tests the app
- Pushes Docker image to Docker Hub
- Deploys to AWS / GitHub Pages


# Contributors
KOBUMANZI ESETHER - https://github.com/Esether-Manzi
NAKALEMBE SARAH - https://github.com/MUMMABBY
TIBEINGANA DEREK - https://github.com/Derek777git
