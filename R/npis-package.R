#' @description
#' An [S3 vctrs class](https://github.com/r-lib/vctrs/) representing a
#' __National Provider Identifier__, a unique 10-digit identification number
#' assigned to healthcare providers in the United States. This identifier is
#' crucial for billing and administrative transactions as mandated by the
#' Health Insurance Portability and Accountability Act (HIPAA).
#'
#' ### Requirements for the NPI
#'
#'    1. The NPI must meet the specifications detailed in the _Final Rule for the_
#'       _Standard Unique Health Identifier for Health Care Providers_ ([69 FR 3434](https://www.federalregister.gov/documents/2004/01/23/04-1149/hipaa-administrative-simplification-standard-unique-health-identifier-for-health-care-providers)),
#'       published on January 23, 2004.
#'    2. The NPI must consist of 9 numeric digits followed by one numeric check digit.
#'    3. The NPI must not have embedded intelligence.
#'    4. The NPI format and check digit calculation must be compatible with the
#'       card issuer identifier on a standard health identification card. The
#'       card standard was developed by NCITS, which is accredited by ANSI. Each
#'       card issuer identifier used on a standard health identification card must
#'       be unique. Therefore the NPI must be generated in a manner that will avoid
#'       collisions with other identifiers that might be used as card issuer
#'       identifiers on standard health identification cards. In order to avoid such
#'       collisions, NPIs will initially be issued with a first digit of 1 or 2.
#'       These digits will not be used as the first digits for other card issuer
#'       identifiers. Use of other first digits must be coordinated with the use of first
#'       digits by the standard health plan identifier, when adopted.
#'    5. Within the constraints of No. 4. above, the NPI generation must use a
#'       scattering algorithm that has the capability to use all possible numeric
#'       combinations beginning with a 1 or 2.
#'    6. Each NPI generated must be unique, without requiring database access for verification.
#'
#' ### Requirements for the NPI Check Digit
#'
#' The NPI check digit is calculated using the [Luhn algorithm](https://en.wikipedia.org/wiki/Luhn_algorithm)
#' for computing the modulus 10 "double-add-double" check digit, a recognized
#' ISO standard ([ISO/IEC 7812](https://en.wikipedia.org/wiki/ISO/IEC_7812)).
#'
#' When an NPI is used as a card issuer identifier on a standard health identification
#' card, it is prefixed by `80840`, in which `80` indicates __Health Applications__
#' and `840` indicates __United States__.
#'
#' The check digit will always be calculated as if the prefix is present. This is
#' accomplished by simply adding the constant `24` in the check digit calculation
#' when the NPI is used without the prefix.
#'
#' @source [PDF: Requirements for National Provider Identifier (NPI) and NPI Check Digit](https://www.cms.gov/Regulations-and-Guidance/Administrative-Simplification/NationalProvIdentStand/Downloads/NPIcheckdigit.pdf)
#' @export
"_PACKAGE"

## usethis namespace: start
#' @import vctrs
#' @import rlang
#' @importFrom methods setOldClass
## usethis namespace: end
NULL
