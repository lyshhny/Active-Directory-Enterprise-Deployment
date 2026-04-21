# Enterprise Active Directory Deployment & Automation Lab

##  Objective
The goal of this project was to design, build, and configure a simulated enterprise domain environment from the ground up. This lab focuses on automating user provisioning, establishing centralized security policies, and managing virtualized network routing.

##  Skills & Technologies
- **Operating Systems:** Windows Server 2022, Windows 10 Pro
- **Core Services:** Active Directory Domain Services (AD DS), DNS, Group Policy Management (GPO)
- **Automation:** Windows PowerShell
- **Virtualization:** Oracle VM VirtualBox, Internal Network Routing

##  Key Configurations & Achievements
1. **Infrastructure Deployment:** Configured a Windows Server 2022 Domain Controller with a static IPv4 network stack and promoted it to establish the `toronto.local` forest.
2. **PowerShell Automation:** Developed the `bulk_user_import.ps1` script to automate the creation of 20+ domain users from a CSV file. The script dynamically assigns passwords, UserPrincipalNames, and maps users to their respective Organizational Units (OUs), eliminating manual entry.
3. **Group Policy Object (GPO) Governance:** - Implemented automated network drive mapping for the Marketing department.
   - Enforced endpoint security by restricting standard user access to the Windows Control Panel via `shell32.dll` block policies.
4. **Network Troubleshooting:** Diagnosed and resolved a hypervisor-level routing conflict by isolating the virtual switches and rebuilding the internal network adapter pathways, ensuring a successful Kerberos handshake between the Server and Client.

##  Repository Contents
- `bulk_user_import.ps1`: The PowerShell script used to automate AD user creation.
- `users.csv`: The sanitized sample dataset used for the bulk import.

##  Technical Documentation
For a complete, step-by-step visual breakdown of the architecture, GPO configurations, and routing troubleshooting, please refer to my full Case Study PDF featured on my LinkedIn profile.
