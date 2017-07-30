---
title: "Audit And Accountability"
description: "Audit And Accountability reference"
keywords: "standards, compliance, security, 800-53, Audit And Accountability"
---

## AU-1 Audit And Accountability Policy And Procedures

**Description:**

The organization:
<ol type="a">
<li>Develops, documents, and disseminates to [Assignment: organization-defined personnel or roles]:</li>

<ol type="1">
<li>An audit and accountability policy that addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance; and</li>    
<li>Procedures to facilitate the implementation of the audit and accountability policy and associated audit and accountability controls; and</li>    
</ol>
<li>Reviews and updates the current:</li>

<ol type="1">
<li>Audit and accountability policy [Assignment: organization-defined frequency]; and</li>    
<li>Audit and accountability procedures [Assignment: organization-defined frequency].</li>    
</ol>
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-2 Audit Events

**Description:**

The organization:
<ol type="a">
<li>Determines that the information system is capable of auditing the following events: [Assignment: organization-defined auditable events];</li>
<li>Coordinates the security audit function with other organizational entities requiring audit-related information to enhance mutual support and to help guide the selection of auditable events;</li>
<li>Provides a rationale for why the auditable events are deemed to be adequate to support after-the-fact investigations of security incidents; and</li>
<li>Determines that the following events are to be audited within the information system: [Assignment: organization-defined audited events (the subset of the auditable events defined in AU-2 a.) along with the frequency of (or situation requiring) auditing for each identified event].</li>
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

## AU-2 (1) Compilation Of Audit Records From Multiple Sources

**Description:**

[Withdrawn: Incorporated into AU-12].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-2 (2) Selection Of Audit Events By Component

**Description:**

[Withdrawn: Incorporated into AU-12].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-2 (3) Reviews And Updates

**Description:**

The organization reviews and updates the audited events [Assignment: organization-defined frequency].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-2 (4) Privileged Functions

**Description:**

[Withdrawn: Incorporated into AC-6 (9)].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-3 Content Of Audit Records

**Description:**

The information system generates audit records containing information that establishes what type of event occurred, when the event occurred, where the event occurred, the source of the event, the outcome of the event, and the identity of any individuals or subjects associated with the event.
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
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>complete<br/></td>
<td>service provider system specific<br/></td>
</tr>
</table>

## AU-3 (1) Additional Audit Information

**Description:**

The information system generates audit records containing the following additional information: [Assignment: organization-defined additional, more detailed information].
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

## AU-3 (2) Centralized Management Of Planned Audit Record Content

**Description:**

The information system provides centralized management and configuration of the content to be captured in audit records generated by [Assignment: organization-defined information system components].
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

## AU-4 Audit Storage Capacity

**Description:**

The organization allocates audit record storage capacity in accordance with [Assignment: organization-defined audit record storage requirements].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-4 (1) Transfer To Alternate Storage

**Description:**

The information system off-loads audit records [Assignment: organization-defined frequency] onto a different system or media than the system being audited.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-5 Response To Audit Processing Failures

**Description:**

The information system:
<ol type="a">
<li>Alerts [Assignment: organization-defined personnel or roles] in the event of an audit processing failure; and</li>
<li>Takes the following additional actions: [Assignment: organization-defined actions to be taken (e.g., shut down information system, overwrite oldest audit records, stop generating audit records)].</li>
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

## AU-5 (1) Audit Storage Capacity

**Description:**

The information system provides a warning to [Assignment: organization-defined personnel, roles, and/or locations] within [Assignment: organization-defined time period] when allocated audit record storage volume reaches [Assignment: organization-defined percentage] of repository maximum audit record storage capacity.
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

## AU-5 (2) Real-Time Alerts

**Description:**

The information system provides an alert in [Assignment: organization-defined real-time period] to [Assignment: organization-defined personnel, roles, and/or locations] when the following audit failure events occur: [Assignment: organization-defined audit failure events requiring real-time alerts].
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

## AU-5 (3) Configurable Traffic Volume Thresholds

**Description:**

The information system enforces configurable network communications traffic volume thresholds reflecting limits on auditing capacity and [Selection: rejects; delays] network traffic above those thresholds.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-5 (4) Shutdown On Failure

**Description:**

The information system invokes a [Selection: full system shutdown; partial system shutdown; degraded operational mode with limited mission/business functionality available] in the event of [Assignment: organization-defined audit failures], unless an alternate audit capability exists.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-6 Audit Review, Analysis, And Reporting

**Description:**

The organization:
<ol type="a">
<li>Reviews and analyzes information system audit records [Assignment: organization-defined frequency] for indications of [Assignment: organization-defined inappropriate or unusual activity]; and</li>
<li>Reports findings to [Assignment: organization-defined personnel or roles].</li>
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-6 (1) Process Integration

**Description:**

The organization employs automated mechanisms to integrate audit review, analysis, and reporting processes to support organizational processes for investigation and response to suspicious activities.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-6 (2) Automated Security Alerts

**Description:**

[Withdrawn: Incorporated into SI-4].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-6 (3) Correlate Audit Repositories

**Description:**

The organization analyzes and correlates audit records across different repositories to gain organization-wide situational awareness.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-6 (4) Central Review And Analysis

**Description:**

The information system provides the capability to centrally review and analyze audit records from multiple components within the system.
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

## AU-6 (5) Integration / Scanning And Monitoring Capabilities

**Description:**

The organization integrates analysis of audit records with analysis of [Selection (one or more): vulnerability scanning information; performance data; information system monitoring information; [Assignment: organization-defined data/information collected from other sources]] to further enhance the ability to identify inappropriate or unusual activity.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-6 (6) Correlation With Physical Monitoring

**Description:**

The organization correlates information from audit records with information obtained from monitoring physical access to further enhance the ability to identify suspicious, inappropriate, unusual, or malevolent activity.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-6 (7) Permitted Actions

**Description:**

The organization specifies the permitted actions for each [Selection (one or more): information system process; role; user] associated with the review, analysis, and reporting of audit information.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-6 (8) Full Text Analysis Of Privileged Commands

**Description:**

The organization performs a full text analysis of audited privileged commands in a physically distinct component or subsystem of the information system, or other information system that is dedicated to that analysis.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-6 (9) Correlation With Information From Nontechnical Sources

**Description:**

The organization correlates information from nontechnical sources with audit information to enhance organization-wide situational awareness.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-6 (10) Audit Level Adjustment

**Description:**

The organization adjusts the level of audit review, analysis, and reporting within the information system when there is a change in risk based on law enforcement information, intelligence information, or other credible sources of information.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-7 Audit Reduction And Report Generation

**Description:**

The information system provides an audit reduction and report generation capability that:
<ol type="a">
<li>Supports on-demand audit review, analysis, and reporting requirements and after-the-fact investigations of security incidents; and</li>
<li>Does not alter the original content or time ordering of audit records.</li>
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

## AU-7 (1) Automatic Processing

**Description:**

The information system provides the capability to process audit records for events of interest based on [Assignment: organization-defined audit fields within audit records].
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

## AU-7 (2) Automatic Sort And Search

**Description:**

The information system provides the capability to sort and search audit records for events of interest based on the content of [Assignment: organization-defined audit fields within audit records].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-8 Time Stamps

**Description:**

The information system:
<ol type="a">
<li>Uses internal system clocks to generate time stamps for audit records; and</li>
<li>Records time stamps for audit records that can be mapped to Coordinated Universal Time (UTC) or Greenwich Mean Time (GMT) and meets [Assignment: organization-defined granularity of time measurement].</li>
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

## AU-8 (1) Synchronization With Authoritative Time Source

**Description:**

The information system:
<ol type="a">
<li>Compares the internal information system clocks [Assignment: organization-defined frequency] with [Assignment: organization-defined authoritative time source]; and</li>
<li>Synchronizes the internal system clocks to the authoritative time source when the time difference is greater than [Assignment: organization-defined time period].</li>
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

## AU-8 (2) Secondary Authoritative Time Source

**Description:**

The information system identifies a secondary authoritative time source that is located in a different geographic region than the primary authoritative time source.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-9 Protection Of Audit Information

**Description:**

The information system protects audit information and audit tools from unauthorized access, modification, and deletion.
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

## AU-9 (1) Hardware Write-Once Media

**Description:**

The information system writes audit trails to hardware-enforced, write-once media.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-9 (2) Audit Backup On Separate Physical Systems / Components

**Description:**

The information system backs up audit records [Assignment: organization-defined frequency] onto a physically different system or system component than the system or component being audited.
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

## AU-9 (3) Cryptographic Protection

**Description:**

The information system implements cryptographic mechanisms to protect the integrity of audit information and audit tools.
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
</table>

## AU-9 (4) Access By Subset Of Privileged Users

**Description:**

The organization authorizes access to management of audit functionality to only [Assignment: organization-defined subset of privileged users].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-9 (5) Dual Authorization

**Description:**

The organization enforces dual authorization for [Selection (one or more): movement; deletion] of [Assignment: organization-defined audit information].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-9 (6) Read Only Access

**Description:**

The organization authorizes read-only access to audit information to [Assignment: organization-defined subset of privileged users].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-10 Non-Repudiation

**Description:**

The information system protects against an individual (or process acting on behalf of an individual) falsely denying having performed [Assignment: organization-defined actions to be covered by non-repudiation].
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
</table>

## AU-10 (1) Association Of Identities

**Description:**

The information system:
<ol type="a">
<li>Binds the identity of the information producer with the information to [Assignment: organization-defined strength of binding]; and</li>
<li>Provides the means for authorized individuals to determine the identity of the producer of the information.</li>
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-10 (2) Validate Binding Of Information Producer Identity

**Description:**

The information system:
<ol type="a">
<li>Validates the binding of the information producer identity to the information at [Assignment: organization-defined frequency]; and</li>
<li>Performs [Assignment: organization-defined actions] in the event of a validation error.</li>
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-10 (3) Chain Of Custody

**Description:**

The information system maintains reviewer/releaser identity and credentials within the established chain of custody for all information reviewed or released.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-10 (4) Validate Binding Of Information Reviewer Identity

**Description:**

The information system:
<ol type="a">
<li>Validates the binding of the information reviewer identity to the information at the transfer or release points prior to release/transfer between [Assignment: organization-defined security domains]; and</li>
<li>Performs [Assignment: organization-defined actions] in the event of a validation error.</li>
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-10 (5) Digital Signatures

**Description:**

[Withdrawn: Incorporated into SI-7].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-11 Audit Record Retention

**Description:**

The organization retains audit records for [Assignment: organization-defined time period consistent with records retention policy] to provide support for after-the-fact investigations of security incidents and to meet regulatory and organizational information retention requirements.
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

## AU-11 (1) Long-Term Retrieval Capability

**Description:**

The organization employs [Assignment: organization-defined measures] to ensure that long-term audit records generated by the information system can be retrieved.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-12 Audit Generation

**Description:**

The information system:
<ol type="a">
<li>Provides audit record generation capability for the auditable events defined in AU-2 a. at [Assignment: organization-defined information system components];</li>
<li>Allows [Assignment: organization-defined personnel or roles] to select which auditable events are to be audited by specific components of the information system; and</li>
<li>Generates audit records for the events defined in AU-2 d. with the content defined in AU-3.</li>
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

## AU-12 (1) System-Wide / Time-Correlated Audit Trail

**Description:**

The information system compiles audit records from [Assignment: organization-defined information system components] into a system-wide (logical or physical) audit trail that is time-correlated to within [Assignment: organization-defined level of tolerance for the relationship between time stamps of individual records in the audit trail].
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

## AU-12 (2) Standardized Formats

**Description:**

The information system produces a system-wide (logical or physical) audit trail composed of audit records in a standardized format.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-12 (3) Changes By Authorized Individuals

**Description:**

The information system provides the capability for [Assignment: organization-defined individuals or roles] to change the auditing to be performed on [Assignment: organization-defined information system components] based on [Assignment: organization-defined selectable event criteria] within [Assignment: organization-defined time thresholds].
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

## AU-13 Monitoring For Information Disclosure

**Description:**

The organization monitors [Assignment: organization-defined open source information and/or information sites] [Assignment: organization-defined frequency] for evidence of unauthorized disclosure of organizational information.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-13 (1) Use Of Automated Tools

**Description:**

The organization employs automated mechanisms to determine if organizational information has been disclosed in an unauthorized manner.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-13 (2) Review Of Monitored Sites

**Description:**

The organization reviews the open source information sites being monitored [Assignment: organization-defined frequency].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-14 Session Audit

**Description:**

The information system provides the capability for authorized users to select a user session to capture/record or view/hear.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-14 (1) System Start-Up

**Description:**

The information system initiates session audits at system start-up.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-14 (2) Capture/Record And Log Content

**Description:**

The information system provides the capability for authorized users to capture/record and log content related to a user session.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-14 (3) Remote Viewing / Listening

**Description:**

The information system provides the capability for authorized users to remotely view/hear all content related to an established user session in real time.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-15 Alternate Audit Capability

**Description:**

The organization provides an alternate audit capability in the event of a failure in primary audit capability that provides [Assignment: organization-defined alternate audit functionality].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-16 Cross-Organizational Auditing

**Description:**

The organization employs [Assignment: organization-defined methods] for coordinating [Assignment: organization-defined audit information] among external organizations when audit information is transmitted across organizational boundaries.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-16 (1) Identity Preservation

**Description:**

The organization requires that the identity of individuals be preserved in cross-organizational audit trails.
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
## AU-16 (2) Sharing Of Audit Information

**Description:**

The organization provides cross-organizational audit information to [Assignment: organization-defined organizations] based on [Assignment: organization-defined cross-organizational sharing agreements].
<ol type="a">
</ol>

**Control Information:**


**Responsible role(s)** - Organization
