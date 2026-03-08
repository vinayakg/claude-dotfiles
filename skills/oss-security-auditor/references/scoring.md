# OSS Security Scoring Guide

This document provides detailed criteria for scoring each security category in the OSS Security Analysis.

---

## Scoring Philosophy

- **Start at 100**: Each category begins with a perfect score
- **Deduct for findings**: Points are removed based on severity
- **Floor at 0**: Scores cannot go negative
- **Weighted average**: Categories contribute differently to the overall score

---

## Severity Point Deductions

| Severity | Points Deducted | Typical Issues |
|----------|-----------------|----------------|
| CRITICAL | -30 | RCE, data breach risk, critical red flags |
| HIGH | -15 | Exploitable vulnerabilities, significant exposure |
| MEDIUM | -8 | Moderate risk issues, should be addressed |
| LOW | -3 | Minor issues, best practice violations |
| INFO | 0 | Observations only, no security impact |

### Deduction Stacking

Multiple findings of the same severity stack:
- 2 HIGH findings = -30 points (2 × 15)
- 1 CRITICAL + 2 MEDIUM = -46 points (30 + 16)

---

## Category: Dependency Security (Weight: 20%)

### Scoring Criteria

| Finding Type | Severity | Notes |
|--------------|----------|-------|
| CVE with CVSS >= 9.0 | CRITICAL | Remote code execution, critical data exposure |
| CVE with CVSS 7.0-8.9 | HIGH | Significant vulnerability |
| CVE with CVSS 4.0-6.9 | MEDIUM | Moderate vulnerability |
| CVE with CVSS < 4.0 | LOW | Minor vulnerability |
| Dependency > 3 major versions behind | MEDIUM | Security patches likely missing |
| Dependency > 2 years without update | MEDIUM | Potential abandonment |
| No lockfile present | MEDIUM | Non-reproducible builds, supply chain risk |
| Floating versions (^, ~, *) | LOW | Version unpredictability |
| Excessive dependencies (> 500 total) | LOW | Large attack surface |
| Known typosquat risk | HIGH | Supply chain attack vector |

### Score Interpretation

| Score Range | Meaning |
|-------------|---------|
| 90-100 | Excellent dependency hygiene |
| 80-89 | Good, minor updates needed |
| 70-79 | Fair, some vulnerabilities present |
| 60-69 | Poor, multiple vulnerabilities |
| 0-59 | Critical, significant CVE exposure |

---

## Category: Code Security (Weight: 25%)

### Scoring Criteria

| Finding Type | Severity | Condition |
|--------------|----------|-----------|
| **Injection Flaws** | | |
| SQL Injection | CRITICAL | User input in query without parameterization |
| Command Injection | CRITICAL | User input in shell execution |
| XSS (Stored) | HIGH | Persisted unsanitized output |
| XSS (Reflected) | MEDIUM | Immediate unsanitized output |
| Template Injection | HIGH | User input in template rendering |
| LDAP Injection | HIGH | User input in LDAP queries |
| **Secrets** | | |
| Hardcoded production API key | CRITICAL | Verified or likely production key |
| Hardcoded test/dev API key | MEDIUM | Clearly marked as non-production |
| Private key in repository | CRITICAL | RSA, SSH, or other private keys |
| Database password in code | CRITICAL | Connection strings with credentials |
| JWT secret hardcoded | HIGH | Static secret for token signing |
| **Cryptography** | | |
| MD5/SHA1 for passwords | HIGH | Weak password hashing |
| MD5/SHA1 for checksums | LOW | Acceptable for non-security use |
| Hardcoded encryption key | HIGH | Static key in source |
| Weak cipher (DES, RC4) | HIGH | Known broken algorithms |
| ECB mode usage | MEDIUM | Insecure cipher mode |
| **Path Traversal** | | |
| Unvalidated file paths | HIGH | User input directly in file ops |
| Partial validation | MEDIUM | Incomplete sanitization |
| **Deserialization** | | |
| Unsafe deserialization | HIGH | Untrusted data deserialized |
| **Auth/AuthZ** | | |
| Missing authentication check | HIGH | Unprotected sensitive endpoints |
| Hardcoded credentials | CRITICAL | Username/password in code |
| Broken access control | HIGH | Privilege escalation possible |
| **Misconfigurations** | | |
| Debug mode in production | MEDIUM | Exposes internal details |
| Verbose error messages | LOW | Information disclosure |
| CORS allow all origins | MEDIUM | Overly permissive policy |
| SSL verification disabled | HIGH | MITM vulnerability |

### Score Interpretation

| Score Range | Meaning |
|-------------|---------|
| 90-100 | Secure code practices |
| 80-89 | Good with minor issues |
| 70-79 | Several issues need attention |
| 60-69 | Significant security flaws |
| 0-59 | Critical vulnerabilities present |

---

## Category: Data Privacy (Weight: 30%)

**This category has the highest weight due to enterprise data protection requirements.**

### Critical Red Flags (Automatic Findings)

| Red Flag | Severity | Detection |
|----------|----------|-----------|
| Cryptocurrency/wallet access | CRITICAL | ethers, web3, bitcoin libs, wallet patterns |
| Telemetry without consent | CRITICAL | Analytics SDKs, tracking pixels |
| Credential harvesting patterns | CRITICAL | Browser storage access, SSH key paths |

### Additional Scoring Criteria

| Finding Type | Severity | Condition |
|--------------|----------|-----------|
| **Data Collection** | | |
| PII collected without disclosure | HIGH | Names, emails, etc. collected silently |
| Excessive data collection | MEDIUM | More data than necessary |
| Financial data handling | HIGH | Credit cards, bank accounts |
| Health data handling | HIGH | Medical information |
| **Data Transmission** | | |
| Data sent to third parties | HIGH | Without clear user consent |
| Unencrypted transmission | CRITICAL | PII sent over HTTP |
| External analytics | MEDIUM | With proper disclosure |
| **Data Storage** | | |
| PII in logs | HIGH | Sensitive data logged |
| Unencrypted sensitive storage | HIGH | Passwords, tokens in plaintext |
| **Tracking** | | |
| Geolocation without consent | HIGH | GPS or IP-based location |
| Device fingerprinting | MEDIUM | Browser/device identification |
| Clipboard access | MEDIUM | Reading clipboard data |
| **File System** | | |
| Broad file enumeration | HIGH | Scanning beyond stated purpose |
| Home directory access | MEDIUM | Accessing user directories |

### Score Interpretation

| Score Range | Meaning |
|-------------|---------|
| 90-100 | Privacy-respecting implementation |
| 80-89 | Minor privacy concerns |
| 70-79 | Notable data handling issues |
| 60-69 | Significant privacy risks |
| 0-59 | Critical privacy violations |

---

## Category: Compliance (Weight: 15%)

### GDPR Scoring (Max 40 points contribution)

| Requirement | Points if Missing |
|-------------|-------------------|
| Consent mechanisms | -10 |
| Data minimization | -8 |
| Right to deletion | -10 |
| Data portability | -6 |
| Privacy documentation | -6 |

### HIPAA Scoring (Max 30 points contribution)

| Requirement | Points if Missing |
|-------------|-------------------|
| PHI encryption at rest | -8 |
| PHI encryption in transit | -8 |
| Audit logging | -7 |
| Access controls | -7 |

### SOC2 Scoring (Max 30 points contribution)

| Trust Principle | Points if Missing |
|-----------------|-------------------|
| Security controls | -8 |
| Availability patterns | -5 |
| Processing integrity | -6 |
| Confidentiality measures | -6 |
| Privacy controls | -5 |

### Score Interpretation

| Score Range | Meaning |
|-------------|---------|
| 90-100 | Strong compliance posture |
| 80-89 | Good with minor gaps |
| 70-79 | Notable compliance gaps |
| 60-69 | Significant gaps |
| 0-59 | Not suitable for regulated use |

---

## Category: Maintenance Health (Weight: 10%)

### Scoring Criteria

| Factor | Severity | Condition |
|--------|----------|-----------|
| **Activity** | | |
| Last commit > 24 months | HIGH | Likely abandoned |
| Last commit 12-24 months | MEDIUM | Low activity |
| Last commit 6-12 months | LOW | Reduced activity |
| No commits last 6 months | LOW | Slower development |
| **Issue Management** | | |
| > 50% issues unanswered | MEDIUM | Poor responsiveness |
| > 100 stale issues | LOW | Maintenance backlog |
| **Contributors** | | |
| Single maintainer | MEDIUM | Bus factor risk |
| No active contributors | HIGH | Abandonment risk |
| **Quality Indicators** | | |
| No CI/CD | LOW | Quality not automated |
| No tests | MEDIUM | Quality unknown |
| No documentation | LOW | Usability concern |
| **Releases** | | |
| No releases ever | MEDIUM | Stability unknown |
| No release in 2+ years | LOW | Stale releases |

### Score Interpretation

| Score Range | Meaning |
|-------------|---------|
| 90-100 | Actively maintained, healthy project |
| 80-89 | Good maintenance, minor concerns |
| 70-79 | Adequate but showing age |
| 60-69 | Maintenance concerns |
| 0-59 | High abandonment risk |

---

## Overall Score Calculation

### Formula

```
Overall = (Dependency × 0.20) + (Code × 0.25) + (Privacy × 0.30) + (Compliance × 0.15) + (Maintenance × 0.10)
```

### Example Calculation

| Category | Score | Weight | Contribution |
|----------|-------|--------|--------------|
| Dependency | 85 | 0.20 | 17.0 |
| Code | 72 | 0.25 | 18.0 |
| Privacy | 68 | 0.30 | 20.4 |
| Compliance | 80 | 0.15 | 12.0 |
| Maintenance | 90 | 0.10 | 9.0 |
| **Overall** | | | **76.4** |

### Grade Assignment

| Score | Grade | Recommendation |
|-------|-------|----------------|
| 90-100 | A | ADOPT |
| 80-89 | B | ADOPT |
| 70-79 | C | ADOPT_WITH_CAUTION |
| 60-69 | D | DO_NOT_ADOPT |
| 0-59 | F | DO_NOT_ADOPT |

---

## Grade Caps

Regardless of calculated score, certain conditions cap the maximum grade:

| Condition | Max Grade | Rationale |
|-----------|-----------|-----------|
| Any CRITICAL finding | C | Unacceptable risk for enterprise |
| Critical red flag (crypto/telemetry/credentials) | D | Data exfiltration risk |
| 3+ CRITICAL findings | F | Systemic security issues |
| Abandoned (>2 years) + security issues | F | No path to remediation |

### Cap Application

1. Calculate raw score
2. Determine letter grade from score
3. Apply caps (take lowest if multiple apply)
4. Note cap reason in report

---

## Status Thresholds

Each category receives a status based on its score:

| Status | Score Range | Meaning |
|--------|-------------|---------|
| PASS | 80-100 | Meets enterprise standards |
| WARN | 60-79 | Concerns exist, proceed with caution |
| FAIL | 0-59 | Does not meet standards |

---

## Recommendation Mapping

| Grade | Recommendation | Description |
|-------|----------------|-------------|
| A | ADOPT | Safe for enterprise use |
| B | ADOPT | Safe with awareness of minor issues |
| C | ADOPT_WITH_CAUTION | Requires risk acceptance and monitoring |
| D | DO_NOT_ADOPT | Significant issues, not recommended |
| F | DO_NOT_ADOPT | Critical issues, do not use |
