Microsoft Fabric
================

Microsoft Fabric is an end-to-end data and analytics platform where
different data workloads work together on shared storage called OneLake.

Microsoft Fabric brings capabilities that traditionally required
multiple independent services together into a single unified platform.


TRADITIONAL APPROACH
====================

SQL Server
    ↓
Azure Data Factory
    ↓
Azure Data Lake Storage
    ↓
Databricks / Spark
    ↓
Synapse Data Warehouse
    ↓
Power BI


MICROSOFT FABRIC APPROACH
=========================

                 Microsoft Fabric
                        │
        ┌───────────────┼────────────────┐
        │               │                │
        ▼               ▼                ▼
  Data Factory   Data Engineering   Data Science
        │               │                │
        └───────────────┼────────────────┘
                        ▼
                     OneLake
                        │
          ┌─────────────┼──────────────┐
          │             │              │
          ▼             ▼              ▼
      Warehouse      Power BI     Real-Time
                                  Intelligence
          │             │              │
          └─────────────┼──────────────┘
                        ▼
                 Business Users


ONELAKE
=======

OneLake is the unified logical data lake for Microsoft Fabric.

It provides a central storage layer that can be used by different
Fabric workloads.

Fabric workloads can work with the same data without requiring
unnecessary copies of the data across different storage systems.

OneLake is built on Azure Data Lake Storage Gen2 technologies and
supports many data sources through Fabric's connectors.


MICROSOFT FABRIC → ONELAKE → WORKSPACES
========================================

Microsoft Fabric
       │
       ▼
    OneLake
       │
       ├── Workspace A
       │      ├── Lakehouse
       │      ├── Warehouse
       │      └── Notebooks
       │
       ├── Workspace B
       │      ├── Lakehouse
       │      └── Power BI
       │
       └── Workspace C
              ├── Warehouse
              └── Real-Time Intelligence


WHY MICROSOFT FABRIC?
=====================

Microsoft Fabric brings data integration, engineering, science,
warehousing, real-time analytics, and business intelligence into
one platform.

It helps organizations simplify:

• Data storage
• Data integration
• Data engineering
• Data science
• Data warehousing
• Real-time analytics
• Business intelligence
• Governance
• Data discovery and management


KEY FABRIC COMPONENTS
=====================

Microsoft Fabric
       │
       ├── OneLake
       │      └── Unified data storage
       │
       ├── Fabric Workloads
       │      ├── Data Factory
       │      ├── Data Engineering
       │      ├── Data Science
       │      ├── Data Warehouse
       │      ├── Real-Time Intelligence
       │      └── Power BI
       │
       ├── Governance
       │      └── Security, compliance, and data management
       │
       ├── OneLake Catalog
       │      └── Data discovery and management
       │
       └── Copilot
              └── AI-assisted data and analytics experiences
