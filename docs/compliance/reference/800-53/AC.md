---
title: "Access Control"
description: "Access Control reference"
keywords: "standards, compliance, security, 800-53, Access Control"
---

## AC-1 Access Control Policy And Procedures

**Description:**

The organization:
<ol type="a">
<li>Develops, documents, and disseminates to [Assignment: organization-defined personnel or roles]:</li>

<ol type="1">
<li>An access control policy that addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance; and</li>    
<li>Procedures to facilitate the implementation of the access control policy and associated access controls; and</li>    
</ol>
<li>Reviews and updates the current:</li>

<ol type="1">
<li>Access control policy [Assignment: organization-defined frequency]; and</li>    
<li>Access control procedures [Assignment: organization-defined frequency].</li>    
</ol>
</ol>

**Control Information:**

**Responsible role(s)** - Docker system

<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
</table>

## AC-2 Account Management

**Description:**

The organization:
<ol type="a">
<li>Identifies and selects the following types of information system accounts to support organizational missions/business functions: [Assignment: organization-defined information system account types];</li>
<li>Assigns account managers for information system accounts;</li>
<li>Establishes conditions for group and role membership;</li>
<li>Specifies authorized users of the information system, group and role membership, and access authorizations (i.e., privileges) and other attributes (as required) for each account;</li>
<li>Requires approvals by [Assignment: organization-defined personnel or roles] for requests to create information system accounts;</li>
<li>Creates, enables, modifies, disables, and removes information system accounts in accordance with [Assignment: organization-defined procedures or conditions];</li>
<li>Monitors the use of information system accounts;</li>
<li>Notifies account managers:</li>

<ol type="1">
<li>When accounts are no longer required;</li>    
<li>When users are terminated or transferred; and</li>    
<li>When individual information system usage or need-to-know changes;</li>    
</ol>
<li>Authorizes access to the information system based on:</li>

<ol type="1">
<li>A valid access authorization;</li>    
<li>Intended system usage; and</li>    
<li>Other attributes as required by the organization or associated missions/business functions;</li>    
</ol>
<li>Reviews accounts for compliance with account management requirements [Assignment: organization-defined frequency]; and</li>
<li>Establishes a process for reissuing shared/group account credentials (if deployed) when individuals are removed from the group.</li>
</ol>

**Control Information:**

**Responsible role(s)** - Docker system

<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>complete<br/></td>
<td>configured by customer<br/>service provider system specific<br/></td>
</tr>
</table>

## AC-2 (1) Automated System Account Management

**Description:**

The organization employs automated mechanisms to support the management of information system accounts.
<ol type="a">
</ol>

**Control Information:**

**Responsible role(s)** - Docker system

<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Docker Trusted Registry (DTR)</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>complete<br/></td>
<td>configured by customer<br/>service provider system specific<br/></td>
</tr>
</table>

## AC-2 (2) Removal Of Temporary / Emergency Accounts

**Description:**

The information system automatically [Selection: removes; disables] temporary and emergency accounts after [Assignment: organization-defined time period for each type of account].
<ol type="a">
</ol>

**Control Information:**

**Responsible role(s)** - Docker system

<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>none<br/></td>
<td>configured by customer<br/>service provider system specific<br/></td>
</tr>
</table>

## AC-2 (3) Disable Inactive Accounts

**Description:**

The information system automatically disables inactive accounts after [Assignment: organization-defined time period].
<ol type="a">
</ol>

**Control Information:**

**Responsible role(s)** - Docker system

<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>none<br/></td>
<td>configured by customer<br/>service provider system specific<br/></td>
</tr>
</table>

## AC-2 (4) Automated Audit Actions

**Description:**

The information system automatically audits account creation, modification, enabling, disabling, and removal actions, and notifies [Assignment: organization-defined personnel or roles].
<ol type="a">
</ol>

**Control Information:**

**Responsible role(s)** - Docker system

<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
</table>

## AC-2 (5) Inactivity Logout

**Description:**

The organization requires that users log out when [Assignment: organization-defined time-period of expected inactivity or description of when to log out].
<ol type="a">
</ol>

**Control Information:**

**Responsible role(s)** - Docker system

<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>complete<br/></td>
<td>configured by customer<br/>service provider system specific<br/></td>
</tr>
</table>

## AC-2 (6) Dynamic Privilege Management

**Description:**

The information system implements the following dynamic privilege management capabilities: [Assignment: organization-defined list of dynamic privilege management capabilities].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-2 (7) Role-Based Schemes

**Description:**

The organization:
<ol type="a">
<li>Establishes and administers privileged user accounts in accordance with a role-based access scheme that organizes allowed information system access and privileges into roles;</li>
<li>Monitors privileged role assignments; and</li>
<li>Takes [Assignment: organization-defined actions] when privileged role assignments are no longer appropriate.</li>
</ol>

**Control Information:**

**Responsible role(s)** - Docker system

<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Docker Trusted Registry (DTR)</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
</table>

## AC-2 (8) Dynamic Account Creation

**Description:**

The information system creates [Assignment: organization-defined information system accounts] dynamically.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-2 (9) Restrictions On Use Of Shared / Group Accounts

**Description:**

The organization only permits the use of shared/group accounts that meet [Assignment: organization-defined conditions for establishing shared/group accounts].
<ol type="a">
</ol>

**Control Information:**

**Responsible role(s)** - Docker system

<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>complete<br/></td>
<td>configured by customer<br/>service provider system specific<br/></td>
</tr>
</table>

## AC-2 (10) Shared / Group Account Credential Termination

**Description:**

The information system terminates shared/group account credentials when members leave the group.
<ol type="a">
</ol>

**Control Information:**

**Responsible role(s)** - Docker system

<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>complete<br/></td>
<td>configured by customer<br/>service provider system specific<br/></td>
</tr>
</table>

## AC-2 (11) Usage Conditions

**Description:**

The information system enforces [Assignment: organization-defined circumstances and/or usage conditions] for [Assignment: organization-defined information system accounts].
<ol type="a">
</ol>

**Control Information:**

**Responsible role(s)** - Docker system

<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>complete<br/></td>
<td>configured by customer<br/>service provider system specific<br/></td>
</tr>
</table>

## AC-2 (12) Account Monitoring / Atypical Usage

**Description:**

The organization:
<ol type="a">
<li>Monitors information system accounts for [Assignment: organization-defined atypical usage]; and</li>
<li>Reports atypical usage of information system accounts to [Assignment: organization-defined personnel or roles].</li>
</ol>

**Control Information:**

**Responsible role(s)** - Docker system

<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Docker Trusted Registry (DTR)</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>complete<br/></td>
<td>configured by customer<br/>service provider system specific<br/></td>
</tr>
</table>

## AC-2 (13) Disable Accounts For High-Risk Individuals

**Description:**

The organization disables accounts of users posing a significant risk within [Assignment: organization-defined time period] of discovery of the risk.
<ol type="a">
</ol>

**Control Information:**

**Responsible role(s)** - Docker system

<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>complete<br/></td>
<td>configured by customer<br/>service provider system specific<br/></td>
</tr>
</table>

## AC-3 Access Enforcement

**Description:**

The information system enforces approved authorizations for logical access to information           and system resources in accordance with applicable access control policies.
<ol type="a">
</ol>

**Control Information:**

**Responsible role(s)** - Docker system

<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Docker Trusted Registry (DTR)</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
</table>

## AC-3 (1) Restricted Access To Privileged Functions

**Description:**

[Withdrawn: Incorporated into AC-6].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-3 (2) Dual Authorization

**Description:**

The information system enforces dual authorization for [Assignment: organization-defined privileged commands and/or other organization-defined actions].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-3 (3) Mandatory Access Control

**Description:**

The information system enforces [Assignment: organization-defined mandatory access control policy] over all subjects and objects where the policy:
<ol type="a">
<li>Is uniformly enforced across all subjects and objects within the boundary of the information system;</li>
<li>Specifies that a subject that has been granted access to information is constrained from doing any of the following;</li>

<ol type="1">
<li>Passing the information to unauthorized subjects or objects;</li>    
<li>Granting its privileges to other subjects;</li>    
<li>Changing one or more security attributes on subjects, objects, the information system, or information system components;</li>    
<li>Choosing the security attributes and attribute values to be associated with newly created or modified objects; or</li>    
<li>Changing the rules governing access control; and</li>    
</ol>
<li>Specifies that [Assignment: organization-defined subjects] may explicitly be granted [Assignment: organization-defined privileges (i.e., they are trusted subjects)] such that they are not limited by some or all of the above constraints.</li>
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-3 (4) Discretionary Access Control

**Description:**

The information system enforces [Assignment: organization-defined discretionary access control policy] over defined subjects and objects where the policy specifies that a subject that has been granted access to information can do one or more of the following:
<ol type="a">
<li>Pass the  information to any other subjects or objects;</li>
<li>Grant its privileges to other subjects;</li>
<li>Change security attributes on subjects, objects, the information system, or the information system�s components;</li>
<li>Choose the security attributes to be associated with newly created or revised objects; or</li>
<li>Change the rules governing access control.</li>
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-3 (5) Security-Relevant Information

**Description:**

The information system prevents access to [Assignment: organization-defined security-relevant information] except during secure, non-operable system states.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-3 (6) Protection Of User And System Information

**Description:**

[Withdrawn: Incorporated into MP-4 and SC-28].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-3 (7) Role-Based Access Control

**Description:**

The information system enforces a role-based access control policy over defined subjects and objects and controls access based upon [Assignment: organization-defined roles and users authorized to assume such roles].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-3 (8) Revocation Of Access Authorizations

**Description:**

The information system enforces the revocation of access authorizations resulting from changes to the security attributes of subjects and objects based on [Assignment: organization-defined rules governing the timing of revocations of access authorizations].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-3 (9) Controlled Release

**Description:**

The information system does not release information outside of the established system boundary unless:
<ol type="a">
<li>The receiving [Assignment: organization-defined information system or system component] provides [Assignment: organization-defined security safeguards]; and</li>
<li>[Assignment: organization-defined security safeguards] are used to validate the appropriateness of the information designated for release.</li>
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-3 (10) Audited Override Of Access Control Mechanisms

**Description:**

The organization employs an audited override of automated access control mechanisms under [Assignment: organization-defined conditions].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-4 Information Flow Enforcement

**Description:**

The information system enforces approved authorizations for controlling the flow of information within the system and between interconnected systems based on [Assignment: organization-defined information flow control policies].
<ol type="a">
</ol>

**Control Information:**

**Responsible role(s)** - Docker system

<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Docker Trusted Registry (DTR)</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>complete<br/></td>
<td>configured by customer<br/>service provider system specific<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
</table>

## AC-4 (1) Object Security Attributes

**Description:**

The information system uses [Assignment: organization-defined security attributes] associated with [Assignment: organization-defined information, source, and destination objects] to enforce [Assignment: organization-defined information flow control policies] as a basis for flow control decisions.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-4 (2) Processing Domains

**Description:**

The information system uses protected processing domains to enforce [Assignment: organization-defined information flow control policies] as a basis for flow control decisions.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-4 (3) Dynamic Information Flow Control

**Description:**

The information system enforces dynamic information flow control based on [Assignment: organization-defined policies].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-4 (4) Content Check Encrypted Information

**Description:**

The information system prevents encrypted information from bypassing content-checking mechanisms by [Selection (one or more): decrypting the information; blocking the flow of the encrypted information; terminating communications sessions attempting to pass encrypted information; [Assignment: organization-defined procedure or method]].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-4 (5) Embedded Data Types

**Description:**

The information system enforces [Assignment: organization-defined limitations] on embedding data types within other data types.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-4 (6) Metadata

**Description:**

The information system enforces information flow control based on [Assignment: organization-defined metadata].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-4 (7) One-Way Flow Mechanisms

**Description:**

The information system enforces [Assignment: organization-defined one-way information flows] using hardware mechanisms.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-4 (8) Security Policy Filters

**Description:**

The information system enforces information flow control using [Assignment: organization-defined security policy filters] as a basis for flow control decisions for [Assignment: organization-defined information flows].
<ol type="a">
</ol>

**Control Information:**

**Responsible role(s)** - Docker system

<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Docker Trusted Registry (DTR)</td>
<td>complete<br/></td>
<td>configured by customer<br/>service provider system specific<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>complete<br/></td>
<td>configured by customer<br/>service provider system specific<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>complete<br/></td>
<td>configured by customer<br/>service provider system specific<br/></td>
</tr>
</table>

## AC-4 (9) Human Reviews

**Description:**

The information system enforces the use of human reviews for [Assignment: organization-defined information flows] under the following conditions: [Assignment: organization-defined conditions].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-4 (10) Enable / Disable Security Policy Filters

**Description:**

The information system provides the capability for privileged administrators to enable/disable [Assignment: organization-defined security policy filters] under the following conditions: [Assignment: organization-defined conditions].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-4 (11) Configuration Of Security Policy Filters

**Description:**

The information system provides the capability for privileged administrators to configure [Assignment: organization-defined security policy filters] to support different security policies.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-4 (12) Data Type Identifiers

**Description:**

The information system, when transferring information between different security domains, uses [Assignment: organization-defined data type identifiers] to validate data essential for information flow decisions.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-4 (13) Decomposition Into Policy-Relevant Subcomponents

**Description:**

The information system, when transferring information between different security domains, decomposes information into [Assignment: organization-defined policy-relevant subcomponents] for submission to policy enforcement mechanisms.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-4 (14) Security Policy Filter Constraints

**Description:**

The information system, when transferring information between different security domains, implements [Assignment: organization-defined security policy filters] requiring fully enumerated formats that restrict data structure and content.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-4 (15) Detection Of Unsanctioned Information

**Description:**

The information system, when transferring information between different security domains, examines the information for the presence of [Assignment: organized-defined unsanctioned information] and prohibits the transfer of such information in accordance with the [Assignment: organization-defined security policy].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-4 (16) Information Transfers On Interconnected Systems

**Description:**

[Withdrawn: Incorporated into AC-4].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-4 (17) Domain Authentication

**Description:**

The information system uniquely identifies and authenticates source and destination points by [Selection (one or more): organization, system, application, individual] for information transfer.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-4 (18) Security Attribute Binding

**Description:**

The information system binds security attributes to information using [Assignment: organization-defined binding techniques] to facilitate information flow policy enforcement.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-4 (19) Validation Of Metadata

**Description:**

The information system, when transferring information between different security domains, applies the same security policy filtering to metadata as it applies to data payloads.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-4 (20) Approved Solutions

**Description:**

The organization employs [Assignment: organization-defined solutions in approved configurations] to control the flow of [Assignment: organization-defined information] across security domains.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-4 (21) Physical / Logical Separation Of Information Flows

**Description:**

The information system separates information flows logically or physically using [Assignment: organization-defined mechanisms and/or techniques] to accomplish [Assignment: organization-defined required separations by types of information].
<ol type="a">
</ol>

**Control Information:**

**Responsible role(s)** - Docker system

<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Docker Trusted Registry (DTR)</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>complete<br/></td>
<td>configured by customer<br/>service provider system specific<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>complete<br/></td>
<td>configured by customer<br/>service provider system specific<br/></td>
</tr>
</table>

## AC-4 (22) Access Only

**Description:**

The information system provides access from a single device to computing platforms, applications, or data residing on multiple different security domains, while preventing any information flow between the different security domains.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-5 Separation Of Duties

**Description:**

The organization:
<ol type="a">
<li>Separates [Assignment: organization-defined duties of individuals];</li>
<li>Documents separation of duties of individuals; and</li>
<li>Defines information system access authorizations to support separation of duties.</li>
</ol>

**Control Information:**

**Responsible role(s)** - Docker system

<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Docker Trusted Registry (DTR)</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
</table>

## AC-6 Least Privilege

**Description:**

The organization employs the principle of least privilege, allowing only authorized accesses for users (or processes acting on behalf of users) which are necessary to accomplish assigned tasks in accordance with organizational missions and business functions.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-6 (1) Authorize Access To Security Functions

**Description:**

The organization explicitly authorizes access to [Assignment: organization-defined security functions (deployed in hardware, software, and firmware) and security-relevant information].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-6 (2) Non-Privileged Access For Nonsecurity Functions

**Description:**

The organization requires that users of information system accounts, or roles, with access to [Assignment: organization-defined security functions or security-relevant information], use non-privileged accounts or roles, when accessing nonsecurity functions.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-6 (3) Network Access To Privileged Commands

**Description:**

The organization authorizes network access to [Assignment: organization-defined privileged commands] only for [Assignment: organization-defined compelling operational needs] and documents the rationale for such access in the security plan for the information system.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-6 (4) Separate Processing Domains

**Description:**

The information system provides separate processing domains to enable finer-grained allocation of user privileges.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-6 (5) Privileged Accounts

**Description:**

The organization restricts privileged accounts on the information system to [Assignment: organization-defined personnel or roles].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-6 (6) Privileged Access By Non-Organizational Users

**Description:**

The organization prohibits privileged access to the information system by non-organizational users.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-6 (7) Review Of User Privileges

**Description:**

The organization:
<ol type="a">
<li>Reviews [Assignment: organization-defined frequency] the privileges assigned to [Assignment: organization-defined roles or classes of users] to validate the need for such privileges; and</li>
<li>Reassigns or removes privileges, if necessary, to correctly reflect organizational mission/business needs.</li>
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-6 (8) Privilege Levels For Code Execution

**Description:**

The information system prevents [Assignment: organization-defined software] from executing at higher privilege levels than users executing the software.
<ol type="a">
</ol>

**Control Information:**

**Responsible role(s)** - Docker system

<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
</table>

## AC-6 (9) Auditing Use Of Privileged Functions

**Description:**

The information system audits the execution of privileged functions.
<ol type="a">
</ol>

**Control Information:**

**Responsible role(s)** - Docker system

<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
</table>

## AC-6 (10) Prohibit Non-Privileged Users From Executing Privileged Functions

**Description:**

The information system prevents non-privileged users from executing privileged functions to include disabling, circumventing, or altering implemented security safeguards/countermeasures.
<ol type="a">
</ol>

**Control Information:**

**Responsible role(s)** - Docker system

<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
</table>

## AC-7 Unsuccessful Logon Attempts

**Description:**

The information system:
<ol type="a">
<li>Enforces a limit of [Assignment: organization-defined number] consecutive invalid logon attempts by a user during a [Assignment: organization-defined time period]; and</li>
<li>Automatically [Selection: locks the account/node for an [Assignment: organization-defined time period]; locks the account/node until released by an administrator; delays next logon prompt according to [Assignment: organization-defined delay algorithm]] when the maximum number of unsuccessful attempts is exceeded.</li>
</ol>

**Control Information:**

**Responsible role(s)** - Docker system

<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
</table>

## AC-7 (1) Automatic Account Lock

**Description:**

[Withdrawn: Incorporated into AC-7].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-7 (2) Purge / Wipe Mobile Device

**Description:**

The information system purges/wipes information from [Assignment: organization-defined mobile devices] based on [Assignment: organization-defined purging/wiping requirements/techniques] after [Assignment: organization-defined number] consecutive, unsuccessful device logon attempts.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-8 System Use Notification

**Description:**

The information system:
<ol type="a">
<li>Displays to users [Assignment: organization-defined system use notification message or banner] before granting access to the system that provides privacy and security notices consistent with applicable federal laws, Executive Orders, directives, policies, regulations, standards, and guidance and states that:</li>

<ol type="1">
<li>Users are accessing a U.S. Government information system;</li>    
<li>Information system usage may be monitored, recorded, and subject to audit;</li>    
<li>Unauthorized use of the information system is prohibited and subject to criminal and civil penalties; and</li>    
<li>Use of the information system indicates consent to monitoring and recording;</li>    
</ol>
<li>Retains the notification message or banner on the screen until users acknowledge the usage conditions and take explicit actions to log on to or further access the information system; and</li>
<li>For publicly accessible systems:</li>

<ol type="1">
<li>Displays system use information [Assignment: organization-defined conditions], before granting further access;</li>    
<li>Displays references, if any, to monitoring, recording, or auditing that are consistent with privacy accommodations for such systems that generally prohibit those activities; and</li>    
<li>Includes a description of the authorized uses of the system.</li>    
</ol>
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-9 Previous Logon (Access) Notification

**Description:**

The information system notifies the user, upon successful logon (access) to the system, of the date and time of the last logon (access).
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-9 (1) Unsuccessful Logons

**Description:**

The information system notifies the user, upon successful logon/access, of the number of unsuccessful logon/access attempts since the last successful logon/access.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-9 (2) Successful / Unsuccessful Logons

**Description:**

The information system notifies the user of the number of [Selection: successful logons/accesses; unsuccessful logon/access attempts; both] during [Assignment: organization-defined time period].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-9 (3) Notification Of Account Changes

**Description:**

The information system notifies the user of changes to [Assignment: organization-defined security-related characteristics/parameters of the user�s account] during [Assignment: organization-defined time period].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-9 (4) Additional Logon Information

**Description:**

The information system notifies the user, upon successful logon (access), of the following additional information: [Assignment: organization-defined information to be included in addition to the date and time of the last logon (access)].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-10 Concurrent Session Control

**Description:**

The information system limits the number of concurrent sessions for each [Assignment: organization-defined account and/or account type] to [Assignment: organization-defined number].
<ol type="a">
</ol>

**Control Information:**

**Responsible role(s)** - Docker system

<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
</table>

## AC-11 Session Lock

**Description:**

The information system:
<ol type="a">
<li>Prevents further access to the system by initiating a session lock after [Assignment: organization-defined time period] of inactivity or upon receiving a request from a user; and</li>
<li>Retains the session lock until the user reestablishes access using established identification and authentication procedures.</li>
</ol>

**Control Information:**

**Responsible role(s)** - Docker system

<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
</table>

## AC-11 (1) Pattern-Hiding Displays

**Description:**

The information system conceals, via the session lock, information previously visible on the display with a publicly viewable image.
<ol type="a">
</ol>

**Control Information:**

**Responsible role(s)** - Docker system

<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
</table>

## AC-12 Session Termination

**Description:**

The information system automatically terminates a user session after [Assignment: organization-defined conditions or trigger events requiring session disconnect].
<ol type="a">
</ol>

**Control Information:**

**Responsible role(s)** - Docker system

<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
</table>

## AC-12 (1) User-Initiated Logouts / Message Displays

**Description:**

The information system:
<ol type="a">
<li>Provides a logout capability for user-initiated communications sessions whenever authentication is used to gain access to [Assignment: organization-defined information resources]; and</li>
<li>Displays an explicit logout message to users indicating the reliable termination of authenticated communications sessions.</li>
</ol>

**Control Information:**

**Responsible role(s)** - Docker system

<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
</table>

## AC-14 Permitted Actions Without Identification Or Authentication

**Description:**

The organization:
<ol type="a">
<li>Identifies [Assignment: organization-defined user actions] that can be performed on the information system without identification or authentication consistent with organizational missions/business functions; and</li>
<li>Documents and provides supporting rationale in the security plan for the information system, user actions not requiring identification or authentication.</li>
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-14 (1) Necessary Uses

**Description:**

[Withdrawn: Incorporated into AC-14].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-16 Security Attributes

**Description:**

The organization:
<ol type="a">
<li>Provides the means to associate [Assignment: organization-defined types of security attributes] having [Assignment: organization-defined security attribute values] with information in storage, in process, and/or in transmission;</li>
<li>Ensures that the security attribute associations are made and retained with the information;</li>
<li>Establishes the permitted [Assignment: organization-defined security attributes] for [Assignment: organization-defined information systems]; and</li>
<li>Determines the permitted [Assignment: organization-defined values or ranges] for each of the established security attributes.</li>
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-16 (1) Dynamic Attribute Association

**Description:**

The information system dynamically associates security attributes with [Assignment: organization-defined subjects and objects] in accordance with [Assignment: organization-defined security policies] as information is created and combined.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-16 (2) Attribute Value Changes By Authorized Individuals

**Description:**

The information system provides authorized individuals (or processes acting on behalf of individuals) the capability to define or change the value of associated security attributes.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-16 (3) Maintenance Of Attribute Associations By Information System

**Description:**

The information system maintains the association and integrity of [Assignment: organization-defined security attributes] to [Assignment: organization-defined subjects and objects].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-16 (4) Association Of Attributes By Authorized Individuals

**Description:**

The information system supports the association of [Assignment: organization-defined security attributes] with [Assignment: organization-defined subjects and objects] by authorized individuals (or processes acting on behalf of individuals).
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-16 (5) Attribute Displays For Output Devices

**Description:**

The information system displays security attributes in human-readable form on each object that the system transmits to output devices to identify [Assignment: organization-identified special dissemination, handling, or distribution instructions] using [Assignment: organization-identified human-readable, standard naming conventions].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-16 (6) Maintenance Of Attribute Association By Organization

**Description:**

The organization allows personnel to associate, and maintain the association of [Assignment: organization-defined security attributes] with [Assignment: organization-defined subjects and objects] in accordance with [Assignment: organization-defined security policies].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-16 (7) Consistent Attribute Interpretation

**Description:**

The organization provides a consistent interpretation of security attributes transmitted between distributed information system components.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-16 (8) Association Techniques / Technologies

**Description:**

The information system implements [Assignment: organization-defined techniques or technologies] with [Assignment: organization-defined level of assurance] in associating security attributes to information.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-16 (9) Attribute Reassignment

**Description:**

The organization ensures that security attributes associated with information are reassigned only via re-grading mechanisms validated using [Assignment: organization-defined techniques or procedures].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-16 (10) Attribute Configuration By Authorized Individuals

**Description:**

The information system provides authorized individuals the capability to define or change the type and value of security attributes available for association with subjects and objects.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-17 Remote Access

**Description:**

The organization:
<ol type="a">
<li>Establishes and documents usage restrictions, configuration/connection requirements, and implementation guidance for each type of remote access allowed; and</li>
<li>Authorizes remote access to the information system prior to allowing such connections.</li>
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-17 (1) Automated Monitoring / Control

**Description:**

The information system monitors and controls remote access methods.
<ol type="a">
</ol>

**Control Information:**

**Responsible role(s)** - Docker system

<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>complete<br/></td>
<td>configured by customer<br/></td>
</tr>
</table>

## AC-17 (2) Protection Of Confidentiality / Integrity Using Encryption

**Description:**

The information system implements cryptographic mechanisms to protect the confidentiality and integrity of remote access sessions.
<ol type="a">
</ol>

**Control Information:**

**Responsible role(s)** - Docker system

<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Docker Trusted Registry (DTR)</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
</table>

## AC-17 (3) Managed Access Control Points

**Description:**

The information system routes all remote accesses through [Assignment: organization-defined number] managed network access control points.
<ol type="a">
</ol>

**Control Information:**

**Responsible role(s)** - Docker system

<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Docker Trusted Registry (DTR)</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
</table>

## AC-17 (4) Privileged Commands / Access

**Description:**

The organization:
<ol type="a">
<li>Authorizes the execution of privileged commands and access to security-relevant information via remote access only for [Assignment: organization-defined needs]; and</li>
<li>Documents the rationale for such access in the security plan for the information system.</li>
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-17 (5) Monitoring For Unauthorized Connections

**Description:**

[Withdrawn: Incorporated into SI-4].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-17 (6) Protection Of Information

**Description:**

The organization ensures that users protect information about remote access mechanisms from unauthorized use and disclosure.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-17 (7) Additional Protection For Security Function Access

**Description:**

[Withdrawn: Incorporated into AC-3 (10)].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-17 (8) Disable Nonsecure Network Protocols

**Description:**

[Withdrawn: Incorporated into CM-7].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-17 (9) Disconnect / Disable Access

**Description:**

The organization provides the capability to expeditiously disconnect or disable remote access to the information system within [Assignment: organization-defined time period].
<ol type="a">
</ol>

**Control Information:**

**Responsible role(s)** - Docker system

<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Docker Trusted Registry (DTR)</td>
<td>complete<br/></td>
<td>configured by customer<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>complete<br/></td>
<td>configured by customer<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>complete<br/></td>
<td>configured by customer<br/></td>
</tr>
</table>

## AC-18 Wireless Access

**Description:**

The organization:
<ol type="a">
<li>Establishes usage restrictions, configuration/connection requirements, and implementation guidance for wireless access; and</li>
<li>Authorizes wireless access to the information system prior to allowing such connections.</li>
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-18 (1) Authentication And Encryption

**Description:**

The information system protects wireless access to the system using authentication of [Selection (one or more): users; devices] and encryption.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-18 (2) Monitoring Unauthorized Connections

**Description:**

[Withdrawn: Incorporated into SI-4].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-18 (3) Disable Wireless Networking

**Description:**

The organization disables, when not intended for use, wireless networking capabilities internally embedded within information system components prior to issuance and deployment.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-18 (4) Restrict Configurations By Users

**Description:**

The organization identifies and explicitly authorizes users allowed to independently configure wireless networking capabilities.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-18 (5) Antennas / Transmission Power Levels

**Description:**

The organization selects radio antennas and calibrates transmission power levels to reduce the probability that usable signals can be received outside of organization-controlled boundaries.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-19 Access Control For Mobile Devices

**Description:**

The organization:
<ol type="a">
<li>Establishes usage restrictions, configuration requirements, connection requirements, and implementation guidance for organization-controlled mobile devices; and</li>
<li>Authorizes the connection of mobile devices to organizational information systems.</li>
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-19 (1) Use Of  Writable / Portable Storage Devices

**Description:**

[Withdrawn: Incorporated into MP-7].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-19 (2) Use Of Personally Owned Portable Storage Devices

**Description:**

[Withdrawn: Incorporated into MP-7].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-19 (3) Use Of Portable Storage Devices With No Identifiable Owner

**Description:**

[Withdrawn: Incorporated into MP-7].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-19 (4) Restrictions For Classified Information

**Description:**

The organization:
<ol type="a">
<li>Prohibits the use of unclassified mobile devices in facilities containing information systems processing, storing, or transmitting classified information unless specifically permitted by the authorizing official; and</li>
<li>Enforces the following restrictions on individuals permitted by the authorizing official to use unclassified mobile devices in facilities containing information systems processing, storing, or transmitting classified information:</li>

<ol type="1">
<li>Connection of unclassified mobile devices to classified information systems is prohibited;</li>    
<li>Connection of unclassified mobile devices to unclassified information systems requires approval from the authorizing official;</li>    
<li>Use of internal or external modems or wireless interfaces within the unclassified mobile devices is prohibited; and</li>    
<li>Unclassified mobile devices and the information stored on those devices are subject to random reviews and inspections by [Assignment: organization-defined security officials], and if classified information is found, the incident handling policy is followed.</li>    
</ol>
<li>Restricts the connection of classified mobile devices to classified information systems in accordance with [Assignment: organization-defined security policies].</li>
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-19 (5) Full Device / Container-Based  Encryption

**Description:**

The organization employs [Selection: full-device encryption; container encryption] to protect the confidentiality and integrity of information on [Assignment: organization-defined mobile devices].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-20 Use Of External Information Systems

**Description:**

The organization establishes terms and conditions, consistent with any trust relationships established with other organizations owning, operating, and/or maintaining external information systems, allowing authorized individuals to:
<ol type="a">
<li>Access the information system from external information systems; and</li>
<li>Process, store, or transmit organization-controlled information using external information systems.</li>
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-20 (1) Limits On Authorized Use

**Description:**

The organization permits authorized individuals to use an external information system to access the information system or to process, store, or transmit organization-controlled information only when the organization:
<ol type="a">
<li>Verifies the implementation of required security controls on the external system as specified in the organization�s information security policy and security plan; or</li>
<li>Retains approved information system connection or processing agreements with the organizational entity hosting the external information system.</li>
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-20 (2) Portable Storage Devices

**Description:**

The organization [Selection: restricts; prohibits] the use of organization-controlled portable storage devices by authorized individuals on external information systems.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-20 (3) Non-Organizationally Owned Systems / Components / Devices

**Description:**

The organization [Selection: restricts; prohibits] the use of non-organizationally owned information systems, system components, or devices to process, store, or transmit organizational information.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-20 (4) Network Accessible Storage Devices

**Description:**

The organization prohibits the use of [Assignment: organization-defined network accessible storage devices] in external information systems.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-21 Information Sharing

**Description:**

The organization:
<ol type="a">
<li>Facilitates information sharing by enabling authorized users to determine whether access authorizations assigned to the sharing partner match the access restrictions on the information for [Assignment: organization-defined information sharing circumstances where user discretion is required]; and</li>
<li>Employs [Assignment: organization-defined automated mechanisms or manual processes] to assist users in making information sharing/collaboration decisions.</li>
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-21 (1) Automated Decision Support

**Description:**

The information system enforces information-sharing decisions by authorized users based on access authorizations of sharing partners and access restrictions on information to be shared.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-21 (2) Information Search And Retrieval

**Description:**

The information system implements information search and retrieval services that enforce [Assignment: organization-defined information sharing restrictions].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-22 Publicly Accessible Content

**Description:**

The organization:
<ol type="a">
<li>Designates individuals authorized to post information onto a publicly accessible information system;</li>
<li>Trains authorized individuals to ensure that publicly accessible information does not contain nonpublic information;</li>
<li>Reviews the proposed content of information prior to posting onto the publicly accessible information system to ensure that nonpublic information is not included; and</li>
<li>Reviews the content on the publicly accessible information system for nonpublic information [Assignment: organization-defined frequency] and removes such information, if discovered.</li>
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-23 Data Mining Protection

**Description:**

The organization employs [Assignment: organization-defined data mining prevention and detection techniques] for [Assignment: organization-defined data storage objects] to adequately detect and protect against data mining.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-24 Access Control Decisions

**Description:**

The organization establishes procedures to ensure [Assignment: organization-defined access control decisions] are applied to each access request prior to access enforcement.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-24 (1) Transmit Access Authorization Information

**Description:**

The information system transmits [Assignment: organization-defined access authorization information] using [Assignment: organization-defined security safeguards] to [Assignment: organization-defined information systems] that enforce access control decisions.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-24 (2) No User Or Process Identity

**Description:**

The information system enforces access control decisions based on [Assignment: organization-defined security attributes] that do not include the identity of the user or process acting on behalf of the user.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AC-25 Reference Monitor

**Description:**

The information system implements a reference monitor for [Assignment: organization-defined access control policies] that is tamperproof, always invoked, and small enough to be subject to analysis and testing, the completeness of which can be assured.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization