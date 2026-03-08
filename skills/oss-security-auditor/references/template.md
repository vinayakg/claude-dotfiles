# OSS Security Analysis Report Template

This template defines the output format for the OSS Security Analysis Agent.

---

## Output 1: Executive Summary

```markdown
# OSS Security Assessment: [Repository Name]

**Repository**: [URL or Path]  
**Analysis Date**: YYYY-MM-DD  
**Analyst**: OSS Security Analysis Agent v1.0

---

## Quick Verdict

| Metric | Value |
|--------|-------|
| **Overall Score** | XX/100 |
| **Grade** | X |
| **Recommendation** | ADOPT / ADOPT WITH CAUTION / DO NOT ADOPT |
| **Critical Issues** | X |
| **High Issues** | X |
| **Medium Issues** | X |
| **Low Issues** | X |

## Key Findings (Top 5)

1. **[SEVERITY]** [Most critical finding - one sentence description]
2. **[SEVERITY]** [Second most critical finding]
3. **[SEVERITY]** [Third finding]
4. **[SEVERITY]** [Fourth finding]
5. **[SEVERITY]** [Fifth finding]

## Risk Summary

[2-3 sentence summary suitable for executive communication. Should cover:
- Overall security posture
- Primary concerns
- Recommendation rationale]

## Category Scores

| Category | Score | Status |
|----------|-------|--------|
| Dependency Security | XX/100 | PASS/WARN/FAIL |
| Code Security | XX/100 | PASS/WARN/FAIL |
| Data Privacy | XX/100 | PASS/WARN/FAIL |
| Compliance Readiness | XX/100 | PASS/WARN/FAIL |
| Maintenance Health | XX/100 | PASS/WARN/FAIL |

---
```

---

## Output 2: Detailed Technical Report

```markdown
## Detailed Analysis

---

### 1. Dependency Security [Score: XX/100]

#### Summary
[Brief overview of dependency security posture]

#### Dependency Manifests Found
- `[file1]` - [X dependencies]
- `[file2]` - [Y dependencies]

#### Findings

##### Vulnerable Dependencies
| Package | Current Version | CVE | Severity | CVSS | Fixed Version | Description |
|---------|-----------------|-----|----------|------|---------------|-------------|
| package-name | 1.0.0 | CVE-XXXX-XXXXX | CRITICAL | 9.8 | 1.0.1 | Brief description |

##### Outdated Dependencies
| Package | Current | Latest | Age | Risk |
|---------|---------|--------|-----|------|
| package-name | 1.0.0 | 2.0.0 | 18 months | MEDIUM |

##### Supply Chain Concerns
- [Finding 1]
- [Finding 2]

#### Recommendations
1. [Specific action item]
2. [Specific action item]

---

### 2. Code Security [Score: XX/100]

#### Summary
[Brief overview of code security posture]

#### Languages Detected
- [Language 1]: XX% of codebase
- [Language 2]: XX% of codebase

#### Findings by Category

##### Injection Vulnerabilities
| Location | Type | Severity | Description |
|----------|------|----------|-------------|
| `file.js:123` | SQL Injection | HIGH | User input concatenated in query |

##### Hardcoded Secrets
| Location | Type | Severity | Description |
|----------|------|----------|-------------|
| `config.py:45` | API Key | CRITICAL | Exposed API key in source |

##### Insecure Cryptography
| Location | Issue | Severity | Recommendation |
|----------|-------|----------|----------------|
| `auth.js:78` | MD5 for passwords | HIGH | Use bcrypt or argon2 |

##### Path Traversal
| Location | Issue | Severity |
|----------|-------|----------|
| ... | ... | ... |

##### Deserialization
| Location | Issue | Severity |
|----------|-------|----------|
| ... | ... | ... |

##### Authentication/Authorization
| Location | Issue | Severity |
|----------|-------|----------|
| ... | ... | ... |

##### Security Misconfigurations
| Location | Issue | Severity |
|----------|-------|----------|
| ... | ... | ... |

#### Recommendations
1. [Specific action item with file reference]
2. [Specific action item with file reference]

---

### 3. Data Privacy [Score: XX/100]

#### Summary
[Brief overview of data privacy posture]

#### Critical Red Flags

##### Cryptocurrency/Wallet Access
| Status | Details |
|--------|---------|
| DETECTED / NOT DETECTED | [Explanation and file references if detected] |

##### Telemetry/Phone-Home
| Status | Details |
|--------|---------|
| DETECTED / NOT DETECTED | [Explanation and file references if detected] |

##### Credential Harvesting Patterns
| Status | Details |
|--------|---------|
| DETECTED / NOT DETECTED | [Explanation and file references if detected] |

#### Network Communication Analysis
| Endpoint/Domain | Purpose | Data Sent | Risk Level |
|-----------------|---------|-----------|------------|
| api.example.com | API calls | User data | MEDIUM |
| analytics.com | Telemetry | Usage data | HIGH |

#### Data Collection Inventory
| Data Type | Collection Point | Storage | Transmission | Purpose |
|-----------|------------------|---------|--------------|---------|
| Email | signup form | database | API | Authentication |

#### Third-Party Services
| Service | Type | Data Shared | Privacy Policy |
|---------|------|-------------|----------------|
| Sentry | Error tracking | Stack traces, user context | [Link] |

#### Recommendations
1. [Specific action item]
2. [Specific action item]

---

### 4. Compliance [Score: XX/100]

#### GDPR Assessment

| Requirement | Status | Evidence | Gap |
|-------------|--------|----------|-----|
| Consent Mechanisms | PRESENT / PARTIAL / ABSENT | [Details] | [If absent, what's needed] |
| Data Minimization | PRESENT / PARTIAL / ABSENT | [Details] | [If absent, what's needed] |
| Right to Deletion | PRESENT / PARTIAL / ABSENT | [Details] | [If absent, what's needed] |
| Data Portability | PRESENT / PARTIAL / ABSENT | [Details] | [If absent, what's needed] |
| Privacy Documentation | PRESENT / PARTIAL / ABSENT | [Details] | [If absent, what's needed] |

**GDPR Readiness**: XX% compliant

#### HIPAA Assessment

| Requirement | Status | Evidence | Gap |
|-------------|--------|----------|-----|
| PHI Safeguards | PRESENT / PARTIAL / ABSENT / N/A | [Details] | [If absent, what's needed] |
| Encryption at Rest | PRESENT / PARTIAL / ABSENT | [Details] | [If absent, what's needed] |
| Encryption in Transit | PRESENT / PARTIAL / ABSENT | [Details] | [If absent, what's needed] |
| Audit Logging | PRESENT / PARTIAL / ABSENT | [Details] | [If absent, what's needed] |
| Access Controls | PRESENT / PARTIAL / ABSENT | [Details] | [If absent, what's needed] |

**HIPAA Readiness**: XX% compliant

#### SOC2 Assessment

| Trust Principle | Status | Evidence | Gap |
|-----------------|--------|----------|-----|
| Security | PRESENT / PARTIAL / ABSENT | [Details] | [If absent, what's needed] |
| Availability | PRESENT / PARTIAL / ABSENT | [Details] | [If absent, what's needed] |
| Processing Integrity | PRESENT / PARTIAL / ABSENT | [Details] | [If absent, what's needed] |
| Confidentiality | PRESENT / PARTIAL / ABSENT | [Details] | [If absent, what's needed] |
| Privacy | PRESENT / PARTIAL / ABSENT | [Details] | [If absent, what's needed] |

**SOC2 Readiness**: XX% compliant

#### Compliance Recommendations
1. [Specific gap to address]
2. [Specific gap to address]

---

### 5. Maintenance Health [Score: XX/100]

#### Project Vitals

| Metric | Value | Assessment |
|--------|-------|------------|
| Repository Age | X years | - |
| Last Commit | YYYY-MM-DD | HEALTHY / WARNING / CRITICAL |
| Commit Frequency | X/month avg | HEALTHY / WARNING / CRITICAL |
| Open Issues | X | - |
| Closed Issues | X | - |
| Issue Response Rate | X% | HEALTHY / WARNING / CRITICAL |
| Open PRs | X | - |
| PR Merge Time | X days avg | HEALTHY / WARNING / CRITICAL |
| Contributors (all time) | X | - |
| Active Contributors (90d) | X | HEALTHY / WARNING / CRITICAL |
| Stars | X | - |
| Forks | X | - |

#### Release Information

| Metric | Value |
|--------|-------|
| Latest Release | vX.X.X (YYYY-MM-DD) |
| Release Cadence | Monthly / Quarterly / Irregular / None |
| Semantic Versioning | Yes / No |

#### Quality Indicators

| Indicator | Status |
|-----------|--------|
| CI/CD Pipeline | PRESENT / ABSENT |
| Test Suite | PRESENT / ABSENT |
| Test Coverage | XX% / Unknown |
| Documentation | Comprehensive / Basic / Minimal |
| CHANGELOG | PRESENT / ABSENT |
| Contributing Guide | PRESENT / ABSENT |

#### Abandonment Risk Assessment
**Risk Level**: LOW / MEDIUM / HIGH / CRITICAL

**Factors**:
- [Factor 1]
- [Factor 2]

---

### 6. License Information

| Attribute | Value |
|-----------|-------|
| License | [License Name] |
| SPDX Identifier | [e.g., MIT, Apache-2.0] |
| License Type | Permissive / Weak Copyleft / Strong Copyleft / Proprietary |
| Commercial Use | Allowed / Conditional / Prohibited |
| Modification | Allowed / Conditional / Prohibited |
| Distribution | Allowed / Conditional / Prohibited |
| Patent Grant | Yes / No / N/A |
| Trademark Grant | Yes / No / N/A |

#### License Considerations
- [Notable clause or obligation]
- [Compatibility notes]

---

## Recommendations Summary

### Immediate Actions Required (Before Adoption)
1. **[CRITICAL]** [Action item]
2. **[HIGH]** [Action item]

### Pre-Production Checklist
- [ ] [Item 1]
- [ ] [Item 2]
- [ ] [Item 3]

### Ongoing Monitoring Recommendations
| What to Monitor | Frequency | Tool/Method |
|-----------------|-----------|-------------|
| Dependency vulnerabilities | Weekly | Dependabot / Snyk |
| Upstream releases | Monthly | GitHub Watch |
| Security advisories | Continuous | GitHub Security Alerts |

---

## Appendix

### A. Files Analyzed
[List of key files examined]

### B. Tools & Methods Used
- Dependency analysis: [method]
- Code scanning: [patterns searched]
- Network analysis: [approach]

### C. Limitations
- [Any limitations of this analysis]
- [Areas that require deeper manual review]

---
```

---

## Output 3: JSON Summary

```json
{
  "meta": {
    "schema_version": "1.0",
    "analysis_version": "1.0",
    "generated_at": "YYYY-MM-DDTHH:MM:SSZ",
    "analyzer": "OSS Security Analysis Agent"
  },
  "repository": {
    "name": "repository-name",
    "url": "https://github.com/owner/repo",
    "local_path": "/path/if/local",
    "default_branch": "main",
    "languages": ["JavaScript", "TypeScript"],
    "primary_language": "JavaScript"
  },
  "verdict": {
    "score": 75,
    "grade": "C",
    "recommendation": "ADOPT_WITH_CAUTION",
    "recommendation_text": "Notable concerns require risk acceptance",
    "summary": "Repository has moderate security posture with some concerning telemetry patterns. Suitable for non-sensitive applications with monitoring.",
    "grade_capped": true,
    "grade_cap_reason": "CRITICAL finding detected"
  },
  "scores": {
    "overall": 75,
    "dependency_security": {
      "score": 82,
      "weight": 0.20,
      "weighted_contribution": 16.4,
      "status": "WARN"
    },
    "code_security": {
      "score": 70,
      "weight": 0.25,
      "weighted_contribution": 17.5,
      "status": "WARN"
    },
    "data_privacy": {
      "score": 65,
      "weight": 0.30,
      "weighted_contribution": 19.5,
      "status": "FAIL"
    },
    "compliance": {
      "score": 80,
      "weight": 0.15,
      "weighted_contribution": 12.0,
      "status": "WARN"
    },
    "maintenance": {
      "score": 95,
      "weight": 0.10,
      "weighted_contribution": 9.5,
      "status": "PASS"
    }
  },
  "findings": {
    "total": 15,
    "by_severity": {
      "critical": 1,
      "high": 3,
      "medium": 5,
      "low": 4,
      "info": 2
    },
    "critical": [
      {
        "id": "FIND-001",
        "category": "data_privacy",
        "subcategory": "telemetry",
        "title": "Telemetry sends user data to external service",
        "description": "Analytics SDK transmits user behavior data to third-party servers",
        "location": "src/analytics.js:45",
        "severity": "CRITICAL",
        "cvss": null,
        "cve": null,
        "remediation": "Remove analytics SDK or implement opt-in consent"
      }
    ],
    "high": [],
    "medium": [],
    "low": [],
    "info": []
  },
  "red_flags": {
    "cryptocurrency_access": {
      "detected": false,
      "details": null,
      "locations": []
    },
    "telemetry_detected": {
      "detected": true,
      "details": "Google Analytics and Segment SDKs found",
      "locations": ["src/analytics.js", "package.json"],
      "endpoints": ["analytics.google.com", "api.segment.io"]
    },
    "credential_harvesting": {
      "detected": false,
      "details": null,
      "locations": []
    }
  },
  "dependencies": {
    "total_count": 145,
    "direct_count": 23,
    "manifests": ["package.json", "package-lock.json"],
    "vulnerable": [
      {
        "package": "lodash",
        "version": "4.17.15",
        "cve": "CVE-2021-23337",
        "severity": "HIGH",
        "cvss": 7.2,
        "fixed_version": "4.17.21",
        "description": "Command Injection vulnerability"
      }
    ],
    "outdated_count": 12
  },
  "compliance_status": {
    "gdpr": {
      "compliant": false,
      "readiness_percentage": 60,
      "gaps": [
        "No consent mechanism for data collection",
        "Missing data deletion functionality"
      ]
    },
    "hipaa": {
      "compliant": false,
      "readiness_percentage": 40,
      "gaps": [
        "No audit logging",
        "PHI not encrypted at rest"
      ],
      "applicable": true
    },
    "soc2": {
      "compliant": false,
      "readiness_percentage": 55,
      "gaps": [
        "Insufficient access controls",
        "Missing availability monitoring"
      ]
    }
  },
  "license": {
    "name": "MIT License",
    "spdx_id": "MIT",
    "type": "permissive",
    "commercial_use": true,
    "modification_allowed": true,
    "distribution_allowed": true,
    "patent_grant": false,
    "copyleft": false,
    "url": "https://opensource.org/licenses/MIT"
  },
  "maintenance": {
    "last_commit_date": "2024-01-15",
    "last_commit_days_ago": 30,
    "commit_frequency_monthly": 15,
    "open_issues": 23,
    "closed_issues": 456,
    "issue_close_rate": 0.95,
    "open_prs": 5,
    "contributors_total": 45,
    "contributors_active_90d": 8,
    "stars": 1234,
    "forks": 234,
    "latest_release": "v2.3.1",
    "latest_release_date": "2024-01-10",
    "has_ci": true,
    "has_tests": true,
    "test_coverage_percent": 78,
    "abandonment_risk": "LOW"
  },
  "recommendations": {
    "immediate": [
      {
        "priority": 1,
        "action": "Update lodash to 4.17.21 to fix CVE-2021-23337",
        "category": "dependency_security"
      }
    ],
    "before_adoption": [
      {
        "priority": 1,
        "action": "Implement consent mechanism for analytics",
        "category": "data_privacy"
      }
    ],
    "ongoing": [
      {
        "action": "Monitor for new CVEs weekly",
        "frequency": "weekly",
        "tool": "Dependabot"
      }
    ]
  }
}
```

---

## Usage Notes

1. **Executive Summary** goes at the top for quick decision-making
2. **Detailed Report** provides technical depth for security engineers
3. **JSON Summary** enables automation, dashboards, and tracking

All three outputs should be generated for every analysis.
