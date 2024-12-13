## HTTP Headers Overview 🚀

These headers are part of an HTTP/2 response, providing essential metadata and control information for the client-server interaction. Here's a breakdown:

- **Status Code**: `HTTP/2 200` - Indicates a successful request.
- **Date**: `Fri, 13 Dec 2024 16:39:29 GMT` - The date and time the response was generated.
- **Content-Type**: `application/json` - Specifies the media type of the resource.
- **Content-Length**: `134` - The size of the response body in bytes.
- **Cache Control**: `no-cache, no-store` - Directives for caching mechanisms.
- **Expires**: `Thu, 01 Jan 1970 00:00:00 GMT` - Indicates the response is already expired.
- **Pragma**: `no-cache` - HTTP/1.0 backward compatibility for cache control.
- **Set-Cookie**: Manages session state with a secure, same-site cookie.
- **Via**: `1.1 grafana` - Shows the request passed through a proxy or gateway.
- **X-Content-Type-Options**: `nosniff` - Prevents MIME type sniffing.
- **Rate Limiting**: 
  - `ratelimit-limit`: `1500/m, max 1000 connections` - Maximum allowed requests.
  - `ratelimit-remaining`: `1499 requests, 1000 connections` - Remaining requests allowed.
  - `ratelimit-reset`: `38s` - Time until rate limit resets.
- **Security Policies**:
  - `Content-Security-Policy`: `sandbox` - Restricts resource loading.
  - `Referrer-Policy`: `same-origin` - Controls the referrer information.
  - `X-Frame-Options`: `deny` - Prevents clickjacking by disallowing framing.
  - `X-XSS-Protection`: `1; mode=block` - Enables XSS filtering.
  - `Strict-Transport-Security`: `max-age=31536000; includeSubDomains` - Enforces secure connections.
- **Miscellaneous**:
  - `X-Report-Abuse`: URL for reporting abuse.
  - `X-MS-RateLimit-*`: Microsoft-specific rate limiting headers.
  - `X-Robots-Tag`: `noindex, nofollow` - Directs search engines not to index or follow links.
  - `X-Served-By`: Identifies the server handling the request.
  - `VSSaaS-Request-ID`: Unique identifier for the request.

These headers are crucial for managing web application performance, security, and user experience. They relate to the existing project by ensuring secure and efficient data exchange, aligning with the project's goals of robust UI development. 🌐🔒

Example Output
---
HTTP/2 200 
date: Fri, 13 Dec 2024 16:39:29 GMT
content-type: application/json
content-length: 134
cache-control: no-cache, no-store
expires: Thu, 01 Jan 1970 00:00:00 GMT
pragma: no-cache
set-cookie: .Tunnels.Relay.WebForwarding.Cookies=CfDJ8E0FHi1JCVNKrny-ARCYWxPqdDoRwMQ0Rj8SuGGrNeDrUuINI2SJIxbzFG0glm-6TLIii65nyD5yVlSwMC6ZJdJvHzJtdpNQslBX3Gz6dGJ7ZtpZvL5pc9DgZ01ujTf8iyFifFyFz7T9fRw34X2VXW3v1pqfubW3noCYuvxCWsJloAbhA6qfe7LA7brCJc0vXjdGf_m-cKmWTt2ASFiz-bIZg5tMppWpfVP1LEak9wsQpiGml76vmWwocjXIgzTj3Gng2lV1ku0UbuBT2-FOXv5tofMBgW6q068zNrlTlmxlKXL_atCKX2L3W3K0KdFkwP5Vr7gsNEBwoMIDaylU31IlDQ-bOQeaFuLxQYS7bfGlwGGaXtVaxIAYUpSzOQxMAyMcG8ZxwHh7a5ZqXMd_FzIcH_IOB-GOh9h4K_kOikSQVDtVskM7aBF84_VUqdCRhLa3xC2Jls08fDctO6xeFh4FcBD9phNQovn69PDs8xtiVSJcP3qi2zcwRlGkoGeRBJD2R_vxU7Xak3a6cPInfDPynW8I2nnAlHqcEpFLR0l4BuABOIVotA7mEbqZjMfYpVePu-h0knK2sP46KRY51oAlmdYv1kCgYiTNxkV-9VfmAdvINxjTmqvj1RRapeTSYMEpp404F-_rz-P5K9RpE7BqNPT5JwxJlvulo3RlDpjAJRX1o-aVDlhXPUg7UZxpE8Y7vyLTqewGHNtKQP4SoPwe6P63pgplpiz1QVlLzqWV7gLr0o6w35Ij6SMkF-645X4ucE88GZ4Rar9fzEX11bupfYhpZlqUu_H8N_m55O8V2lVbb-jf9QIAqM9unJaT2IO_yYFQhscDj-OwgOcSCk1Iaj8EgUfbml7rPDz_2bq5tFBdO-WBw-QvzkfWc5FPqztTfhN_EpQ-BXG5xgVcFz43ollU9-x-kgrqZfBOpskJWhvur-tTxYyxc8oN-mQa1eaHOQeVDjauaRd797SsHTpXUT2W7C7i78Gs4_fzZMW05xjab83rR0Vd9xA4w6LyrQ; path=/; secure; samesite=none
via: 1.1 grafana
x-content-type-options: nosniff
ratelimit-limit: 1500/m, max 1000 connections
ratelimit-remaining: 1499 requests, 1000 connections
ratelimit-reset: 38s
x-report-abuse: https://msrc.microsoft.com/report/abuse
x-ms-ratelimit-limit: 1500
x-ms-ratelimit-remaining: 1496
x-ms-ratelimit-used: 4
x-ms-ratelimit-reset: 0
content-security-policy: sandbox
referrer-policy: same-origin
vssaas-request-id: 8add10ff-6e99-44ca-90c0-1136f315714c
x-frame-options: deny
x-robots-tag: noindex, nofollow
x-served-by: tunnels-prod-rel-uks1-v3-cluster
x-xss-protection: 1; mode=block
strict-transport-security: max-age=31536000; includeSubDomains

prompts:
# 🎯 Prompt Engineering for HTTP Headers Documentation

## Objectives
- Provide clear explanation of HTTP security headers and their purpose
- Document rationale behind each header configuration
- Connect headers implementation to overall project security goals

## Key Results
- Comprehensive header documentation with explanations
- Security implications and benefits clearly outlined  
- Integration with project's monitoring and security features

## Format Requirements
- Use descriptive section headers with emojis
- Include single-line comments for clarity
- Follow consistent markdown structure
- Remove any redundant information

## Quality Checks
- Verify technical accuracy of header descriptions
- Validate markdown formatting
- Ensure clear connection to project goals
- Remove duplicate content
- Test code examples if included
