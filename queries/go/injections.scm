(call_expression
  (selector_expression
    field: (field_identifier) @_field (#eq? @_field "Prepare")
  )
  (argument_list
    (raw_string_literal) @sql
  )
)

(call_expression
  (selector_expression
    field: (field_identifier) @_field (#eq? @_field "Prepare")
  )
  (argument_list
    (interpreted_string_literal) @sql
  )
)

(const_declaration
  (const_spec
    name: (identifier) @name (#eq? @name "query")
    (expression_list
      (interpreted_string_literal) @sql
    )
  )
)

(const_declaration
  (const_spec
    name: (identifier) @name (#eq? @name "query")
    (expression_list
      (raw_string_literal) @sql
    )
  )
)
