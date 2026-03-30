#' @description
#' An [S3 vctrs class](https://github.com/r-lib/vctrs/) representing a
#' __National Provider Identifier__, a unique 10-digit identification number
#' assigned to healthcare providers in the United States, as mandated by the
#' [Health Insurance Portability and Accountability Act (HIPAA)](https://en.wikipedia.org/wiki/Health_Insurance_Portability_and_Accountability_Act).
#'
#' ### NPI Requirements
#'
#'    1. The NPI must meet the specifications detailed in the __Final Rule for the__
#'       __Standard Unique Health Identifier for Health Care Providers__ ([69 FR 3434](https://www.federalregister.gov/documents/2004/01/23/04-1149/hipaa-administrative-simplification-standard-unique-health-identifier-for-health-care-providers)),
#'       published 2004-01-23.
#'    2. The NPI must consist of 9 numeric digits followed by 1 numeric check digit.
#'    3. The NPI must not have embedded intelligence.
#'    4. The NPI format and check digit calculation must be compatible with the
#'       card issuer identifier on a standard health identification card. As each
#'       card issuer identifier must be unique, the NPI must avoid collisions with
#'       other possible card issuer identifiers. NPIs will therefore initially be
#'       issued with a first digit of 1 or 2. These digits will be exclusive to
#'       the NPI.
#'    5. Within the constraints of (4), NPI generation must employ a scattering
#'       algorithm that uses all possible numeric combinations beginning with a 1 or 2.
#'    6. Each NPI generated must be unique, without requiring database access for verification.
#'
#' ### NPI Check Digit
#'
#' The NPI check digit is calculated using the [Luhn algorithm](https://en.wikipedia.org/wiki/Luhn_algorithm)
#' for computing the modulus 10 "double-add-double" check digit, a recognized
#' ISO standard ([ISO/IEC 7812](https://en.wikipedia.org/wiki/ISO/IEC_7812)).
#'
#' When an NPI is used as a card issuer identifier, it is prefixed by `80840`,
#' in which `80` indicates __Health Applications__ and `840` indicates __United States__.
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
#' @importFrom cheapr %in_% %!in_%
#' @importFrom collapse %iin% %!iin%
## usethis namespace: end
NULL
