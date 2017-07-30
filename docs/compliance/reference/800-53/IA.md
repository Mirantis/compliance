---
title: "Identification And Authentication"
description: "Identification And Authentication reference"
keywords: "standards, compliance, security, 800-53, Identification And Authentication"
---

## IA-1 Identification And Authentication Policy And Procedures

**Description:**

The organization:
<ol type="a">
<li>Develops, documents, and disseminates to [Assignment: organization-defined personnel or roles]:</li>

<ol type="1">
<li>An identification and authentication policy that addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance; and</li>
<li>Procedures to facilitate the implementation of the identification and authentication policy and associated identification and authentication controls; and</li>
</ol>
<li>Reviews and updates the current:</li>

<ol type="1">
<li>Identification and authentication policy [Assignment: organization-defined frequency]; and</li>
<li>Identification and authentication procedures [Assignment: organization-defined frequency].</li>
</ol>
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-2 Identification And Authentication (Organizational Users)

**Description:**

The information system uniquely identifies and authenticates organizational users (or processes acting on behalf of organizational users).
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

## IA-2 (1) Network Access To Privileged Accounts

**Description:**

The information system implements multifactor authentication for network access to privileged accounts.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-2 (2) Network Access To Non-Privileged Accounts

**Description:**

The information system implements multifactor authentication for network access to non-privileged accounts.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-2 (3) Local Access To Privileged Accounts

**Description:**

The information system implements multifactor authentication for local access to privileged accounts.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-2 (4) Local Access To Non-Privileged Accounts

**Description:**

The information system implements multifactor authentication for local access to non-privileged accounts.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-2 (5) Group Authentication

**Description:**

The organization requires individuals to be authenticated with an individual authenticator when a group authenticator is employed.
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

## IA-2 (6) Network Access To Privileged Accounts - Separate Device

**Description:**

The information system implements multifactor authentication for network access to privileged accounts such that one of the factors is provided by a device separate from the system gaining access and the device meets [Assignment: organization-defined strength of mechanism requirements].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-2 (7) Network Access To Non-Privileged Accounts - Separate Device

**Description:**

The information system implements multifactor authentication for network access to non-privileged accounts such that one of the factors is provided by a device separate from the system gaining access and the device meets [Assignment: organization-defined strength of mechanism requirements].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-2 (8) Network Access To Privileged Accounts - Replay Resistant

**Description:**

The information system implements replay-resistant authentication mechanisms for network access to privileged accounts.
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

## IA-2 (9) Network Access To Non-Privileged Accounts - Replay Resistant

**Description:**

The information system implements replay-resistant authentication mechanisms for network access to non-privileged accounts.
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

## IA-2 (10) Single Sign-On

**Description:**

The information system provides a single sign-on capability for [Assignment: organization-defined information system accounts and services].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-2 (11) Remote Access  - Separate Device

**Description:**

The information system implements multifactor authentication for remote access to privileged and non-privileged accounts such that one of the factors is provided by a device separate from the system gaining access and the device meets [Assignment: organization-defined strength of mechanism requirements].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-2 (12) Acceptance Of Piv Credentials

**Description:**

The information system accepts and electronically verifies Personal Identity Verification (PIV) credentials.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-2 (13) Out-Of-Band Authentication

**Description:**

The information system implements [Assignment: organization-defined out-of-band authentication] under [Assignment: organization-defined conditions].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-3 Device Identification And Authentication

**Description:**

The information system uniquely identifies and authenticates [Assignment: organization-defined specific and/or types of devices] before establishing a [Selection (one or more): local; remote; network] connection.
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

## IA-3 (1) Cryptographic Bidirectional Authentication

**Description:**

The information system authenticates [Assignment: organization-defined specific devices and/or types of devices] before establishing [Selection (one or more): local; remote; network] connection using bidirectional authentication that is cryptographically based.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-3 (3) Dynamic Address Allocation

**Description:**

The organization:
<ol type="a">
<li>Standardizes dynamic address allocation lease information and the lease duration assigned to devices in accordance with [Assignment: organization-defined lease information and lease duration]; and</li>
<li>Audits lease information when assigned to a device.</li>
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-3 (4) Device Attestation

**Description:**

The organization ensures that device identification and authentication based on attestation is handled by [Assignment: organization-defined configuration management process].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-4 Identifier Management

**Description:**

The organization manages information system identifiers by:
<ol type="a">
<li>Receiving authorization from [Assignment: organization-defined personnel or roles] to assign an individual, group, role, or device identifier;</li>
<li>Selecting an identifier that identifies an individual, group, role, or device;</li>
<li>Assigning the identifier to the intended individual, group, role, or device;</li>
<li>Preventing reuse of identifiers for [Assignment: organization-defined time period]; and</li>
<li>Disabling the identifier after [Assignment: organization-defined time period of inactivity].</li>
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

## IA-4 (1) Prohibit Account Identifiers As Public Identifiers

**Description:**

The organization prohibits the use of information system account identifiers that are the same as public identifiers for individual electronic mail accounts.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-4 (2) Supervisor Authorization

**Description:**

The organization requires that the registration process to receive an individual identifier includes supervisor authorization.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-4 (3) Multiple Forms Of Certification

**Description:**

The organization requires multiple forms of certification of individual identification be presented to the registration authority.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-4 (4) Identify User Status

**Description:**

The organization manages individual identifiers by uniquely identifying each individual as [Assignment: organization-defined characteristic identifying individual status].
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

## IA-4 (5) Dynamic Management

**Description:**

The information system dynamically manages identifiers.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-4 (6) Cross-Organization Management

**Description:**

The organization coordinates with [Assignment: organization-defined external organizations] for cross-organization management of identifiers.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-4 (7) In-Person Registration

**Description:**

The organization requires that the registration process to receive an individual identifier be conducted in person before a designated registration authority.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-5 Authenticator Management

**Description:**

The organization manages information system authenticators by:
<ol type="a">
<li>Verifying, as part of the initial authenticator distribution, the identity of the individual, group, role, or device receiving the authenticator;</li>
<li>Establishing initial authenticator content for authenticators defined by the organization;</li>
<li>Ensuring that authenticators have sufficient strength of mechanism for their intended use;</li>
<li>Establishing and implementing administrative procedures for initial authenticator distribution, for lost/compromised or damaged authenticators, and for revoking authenticators;</li>
<li>Changing default content of authenticators prior to information system installation;</li>
<li>Establishing minimum and maximum lifetime restrictions and reuse conditions for authenticators;</li>
<li>Changing/refreshing authenticators [Assignment: organization-defined time period by authenticator type];</li>
<li>Protecting authenticator content from unauthorized disclosure and modification;</li>
<li>Requiring individuals to take, and having devices implement, specific security safeguards to protect authenticators; and</li>
<li>Changing authenticators for group/role accounts when membership to those accounts changes.</li>
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

## IA-5 (1) Password-Based Authentication

**Description:**

The information system, for password-based authentication:
<ol type="a">
<li>Enforces minimum password complexity of [Assignment: organization-defined requirements for case sensitivity, number of characters, mix of upper-case letters, lower-case letters, numbers, and special characters, including minimum requirements for each type];</li>
<li>Enforces at least the following number of changed characters when new passwords are created: [Assignment: organization-defined number];</li>
<li>Stores and transmits only cryptographically-protected passwords;</li>
<li>Enforces password minimum and maximum lifetime restrictions of [Assignment: organization-defined numbers for lifetime minimum, lifetime maximum];</li>
<li>Prohibits password reuse for [Assignment: organization-defined number] generations; and</li>
<li>Allows the use of a temporary password for system logons with an immediate change to a permanent password.</li>
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

## IA-5 (2) Pki-Based Authentication

**Description:**

The information system, for PKI-based authentication:
<ol type="a">
<li>Validates certifications by constructing and verifying a certification path to an accepted trust anchor including checking certificate status information;</li>
<li>Enforces authorized access to the corresponding private key;</li>
<li>Maps the authenticated identity to the account of the individual or group; and</li>
<li>Implements a local cache of revocation data to support path discovery and validation in case of inability to access revocation information via the network.</li>
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

## IA-5 (3) In-Person Or Trusted Third-Party Registration

**Description:**

The organization requires that the registration process to receive [Assignment: organization-defined types of and/or specific authenticators] be conducted [Selection: in person; by a trusted third party] before [Assignment: organization-defined registration authority] with authorization by [Assignment: organization-defined personnel or roles].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-5 (4) Automated Support  For Password Strength Determination

**Description:**

The organization employs automated tools to determine if password authenticators are sufficiently strong to satisfy [Assignment: organization-defined requirements].
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

## IA-5 (5) Change Authenticators Prior To Delivery

**Description:**

The organization requires developers/installers of information system components to provide unique authenticators or change default authenticators prior to delivery/installation.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-5 (6) Protection Of Authenticators

**Description:**

The organization protects authenticators commensurate with the security category of the information to which use of the authenticator permits access.
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

## IA-5 (7) No Embedded Unencrypted Static Authenticators

**Description:**

The organization ensures that unencrypted static authenticators are not embedded in applications or access scripts or stored on function keys.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-5 (8) Multiple Information System Accounts

**Description:**

The organization implements [Assignment: organization-defined security safeguards] to manage the risk of compromise due to individuals having accounts on multiple information systems.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-5 (9) Cross-Organization Credential Management

**Description:**

The organization coordinates with [Assignment: organization-defined external organizations] for cross-organization management of credentials.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-5 (10) Dynamic Credential Association

**Description:**

The information system dynamically provisions identities.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-5 (11) Hardware Token-Based Authentication

**Description:**

The information system, for hardware token-based authentication, employs mechanisms that satisfy [Assignment: organization-defined token quality requirements].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-5 (12) Biometric-Based Authentication

**Description:**

The information system, for biometric-based authentication, employs mechanisms that satisfy [Assignment: organization-defined biometric quality requirements].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-5 (13) Expiration Of Cached Authenticators

**Description:**

The information system prohibits the use of cached authenticators after [Assignment: organization-defined time period].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-5 (14) Managing Content Of Pki Trust Stores

**Description:**

The organization, for PKI-based authentication, employs a deliberate organization-wide methodology for managing the content of PKI trust stores installed across all platforms including networks, operating systems, browsers, and applications.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-5 (15) Ficam-Approved Products And Services

**Description:**

The organization uses only FICAM-approved path discovery and validation products and services.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-6 Authenticator Feedback

**Description:**

The information system obscures feedback of authentication information during the authentication process to protect the information from possible exploitation/use by unauthorized individuals.
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
</table>

## IA-7 Cryptographic Module Authentication

**Description:**

The information system implements mechanisms for authentication to a cryptographic module that meet the requirements of applicable federal laws, Executive Orders, directives, policies, regulations, standards, and guidance for such authentication.
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
</table>

## IA-8 Identification And Authentication (Non-Organizational Users)

**Description:**

The information system uniquely identifies and authenticates non-organizational users (or processes acting on behalf of non-organizational users).
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
</table>

## IA-8 (1) Acceptance Of Piv Credentials From Other Agencies

**Description:**

The information system accepts and electronically verifies Personal Identity Verification (PIV) credentials from other federal agencies.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-8 (2) Acceptance Of Third-Party Credentials

**Description:**

The information system accepts only FICAM-approved third-party credentials.
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

## IA-8 (3) Use Of Ficam-Approved Products

**Description:**

The organization employs only FICAM-approved information system components in [Assignment: organization-defined information systems] to accept third-party credentials.
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

## IA-8 (4) Use Of Ficam-Issued Profiles

**Description:**

The information system conforms to FICAM-issued profiles.
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

## IA-8 (5) Acceptance Of Piv-I Credentials

**Description:**

The information system accepts and electronically verifies Personal Identity Verification-I (PIV-I) credentials.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-9 Service Identification And Authentication

**Description:**

The organization identifies and authenticates [Assignment: organization-defined information system services] using [Assignment: organization-defined security safeguards].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-9 (1) Information Exchange

**Description:**

The organization ensures that service providers receive, validate, and transmit identification and authentication information.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-9 (2) Transmission Of Decisions

**Description:**

The organization ensures that identification and authentication decisions are transmitted between [Assignment: organization-defined services] consistent with organizational policies.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-10 Adaptive Identification And Authentication

**Description:**

The organization requires that individuals accessing the information system employ [Assignment: organization-defined supplemental authentication techniques or mechanisms] under specific [Assignment: organization-defined circumstances or situations].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## IA-11 Re-Authentication

**Description:**

The organization requires users and devices to re-authenticate when [Assignment: organization-defined circumstances or situations requiring re-authentication].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
