testing
isVersionFileName: name
    "Cypress-Mocks-dkh.10_ad637421-2d36-448b-a56d-34b9fdf3f7a8"

    | namePart uuidPart |
    namePart := name copyUpToLast: $_ .
    uuidPart := name copyAfterLast: $_ .
    ^ uuidPart size = 36 and: [
       (uuidPart allSatisfy: [:c | '0123456789abcdef-' includes: c]) and: [
       namePart size >= 4 and: [
       (namePart includes: $.) and: [
       namePart includes: $-]]]]
