(comment) @comment
(doc_comment) @comment

[
  (string_literal)
  (char_literal)
] @string

[
  (integer_literal)
  (float_literal)
] @number

["(" ")" "{" "}" "[" "]"] @punctuation.bracket

[":" "." "," ";" ] @punctuation.delimiter

["-" "=" "<" "<=" ">" ">=" "!" "++" "--" "||" "&&" "/" "*" "+" "%" "&" "|" "==" "?" "@"] @operator

(type_identifier) @type

((identifier) @type.builtin
 (#match? @type.builtin "^[A-Z]"))

(primitive_keyword) @type.builtin
(enum_declaration (identifier) @type.enum)
(class_declaration (identifier) @type.class)
(interface_declaration (identifier) @type.interface)
(record_declaration (identifier) @type.record)


(object_literal (identifier) @variable.builtin)

(function_declaration  (identifier) @function)
(method_declaration name: (identifier) @method)

(call_expression function: (identifier) @function.call)
(method_call_expression function: (property_access name: (identifier) @method.call))

(property_declaration (identifier) @property)
(property_access name: (identifier) @property)
(record_property_declaration name: (identifier) @property)
(record_method_declaration name: (identifier) @method)

(variable_declaration (identifier) @variable)
(parameter_declaration (identifier) @parameter)

[
  "if" "else" "let" "return" "function" "import" "from" "for" "enum" "export"
  "while" "of" "interface" "extends" "public" "private" "new" "class"
  "implements" "super" "static" "final" "readonly" "in" "const" "as" "break"
  "void" "extern" "continue" "unknown" "type" "record" "decorator" (this_expression)
] @keyword

(boolean_literal) @boolean

(decorator_use) @decorator
(decorator_declaration) @decorator


