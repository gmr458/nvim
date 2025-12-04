; extends

(
    [
        (string_content)
    ] @injection.content
    (#match? @injection.content "(SELECT|INSERT|UPDATE|DELETE).+(FROM|INTO|VALUES|SET).*(WHERE|GROUP BY)?")
    (#set! injection.language "sql")
)

(
    [
        (string_content)
    ] @injection.content
    (#match? @injection.content "(CREATE|ALTER|DROP|TRUNCATE).+(TABLE)?")
    (#set! injection.language "sql")
)
