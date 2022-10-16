import sqlparse, sys

text = sys.stdin.read()

result = sqlparse.format(
    text,
    keyword_case="upper",  # Changes how keywords are formatted. Allowed values are “upper”, “lower” and “capitalize”
    identifier_case="lower",  # Changes how identifiers are formatted. Allowed values are “upper”, “lower”, and “capitalize”
    strip_comments=False,  # If True comments are removed from the statements
    # truncate_strings=None,  # If truncate_strings is a positive integer, string literals longer than the given value will be truncated
    # truncate_char="[…]",  # If long string literals are truncated (see above) this value will be append to the truncated string
    reindent=True,  # If True the indentations of the statements are changed
    reindent_aligned=True,  # If True the indentations of the statements are changed, and statements are aligned by keywords
    use_space_around_operators=True,  # If True spaces are used around all operators
    indent_tabs=False,  # If True tabs instead of spaces are used for indentation
    indent_width=4,  # The width of the indentation, defaults to 2
    wrap_after=80,  # The column limit (in characters) for wrapping comma-separated lists. If unspecified, it puts every item in the list on its own line
    output_format="sql",  # If given the output is additionally formatted to be used as a variable in a programming language. Allowed values are “python” and “php”
    comma_first=False,  # If True comma-first notation for column names is used
)

result = result.strip()

if "\n" in result:
    result = f'"""{result}"""'
else:
    result = f'"{result}"'

print(result)
