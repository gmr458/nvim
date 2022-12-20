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

(short_var_declaration
  left: (expression_list) @_query (#eq? @_query "query")
  right: (expression_list
    (call_expression
      function: (selector_expression
        operand: (identifier) @_fmt (#eq? @_fmt "fmt")
        field: (field_identifier) @_Sprintf (#eq? @_Sprintf "Sprintf")
      )
      arguments: (argument_list
        (interpreted_string_literal) @sql
      )
    )
  )
)
