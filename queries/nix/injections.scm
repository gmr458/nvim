; extends

(apply_expression
  function: (apply_expression
    function: (_) @_func
    argument: (_) @_fname)
  argument: [
    (string_expression
      ((string_fragment) @injection.content
        (#set! injection.language "nu")))
    (indented_string_expression
      ((string_fragment) @injection.content
        (#set! injection.language "nu")))
  ]
  (#lua-match? @_func "^%a*%.*writeText$")
  (#lua-match? @_fname "%.nu")
  (#set! injection.combined))

((apply_expression
  function: (apply_expression
    function: (_) @_func)
  argument: [
    (string_expression
      ((string_fragment) @injection.content
        (#set! injection.language "nu")))
    (indented_string_expression
      ((string_fragment) @injection.content
        (#set! injection.language "nu")))
  ])
  (#lua-match? @_func "^%a*%.*writeNu%a*$")
  (#set! injection.combined))

((apply_expression
  function: (_) @_func
  argument: [
    (string_expression
      ((string_fragment) @injection.content
        (#set! injection.language "nu")))
    (indented_string_expression
      ((string_fragment) @injection.content
        (#set! injection.language "nu")))
  ])
  (#lua-match? @_func "^%a*%.*writeNu%a*$")
  (#set! injection.combined))
