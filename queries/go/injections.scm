(call_expression
  (selector_expression
    field: (field_identifier) @_field (#eq? @_field "Prepare"))
  (argument_list
    (raw_string_literal) @sql))

(call_expression
  (selector_expression
    field: (field_identifier) @_field (#eq? @_field "Prepare"))
  (argument_list
    (interpreted_string_literal) @sql))
