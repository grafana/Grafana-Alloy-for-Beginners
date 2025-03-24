<img width="916" alt="image" src="https://github.com/user-attachments/assets/8d60bee9-9d0f-4e9f-9d62-74d5f10a4ec5" />
<img width="913" alt="image" src="https://github.com/user-attachments/assets/dd978b03-74b9-456e-bedf-d24df79ff069" />
<img width="915" alt="image" src="https://github.com/user-attachments/assets/a5b22089-6037-4c88-afea-4e62c83a7960" />

# Resources for the workshop
- https://github.com/grafana/intro-to-mltp

# Alloy 101 
<img width="909" alt="image" src="https://github.com/user-attachments/assets/d37cbbce-2526-443c-83e5-9c0a3a6b481d" />
<img width="911" alt="image" src="https://github.com/user-attachments/assets/d0f35b76-3aa0-48c6-8678-8310ffc29cdc" />
<img width="913" alt="image" src="https://github.com/user-attachments/assets/32c14388-b5e6-4fcb-ba62-c491729c5f2e" />
<img width="913" alt="image" src="https://github.com/user-attachments/assets/45bf6e1a-e3de-4809-809a-7268a8a6d367" />
<img width="911" alt="image" src="https://github.com/user-attachments/assets/80f3e603-dea7-48fe-80b5-7807431d85e2" />
<img width="917" alt="image" src="https://github.com/user-attachments/assets/0f5c80f3-0b18-45fa-8e4a-3c95a939859d" />
<img width="913" alt="image" src="https://github.com/user-attachments/assets/3aca8547-5d47-4b05-b624-297a1adda4e9" />
<img width="915" alt="image" src="https://github.com/user-attachments/assets/87e09054-937f-429e-a9e2-7167e1bf65ff" />

## Alloy Syntax
### Telemetry pipelines consist of components. 
![Alt Text](https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExNHFwc2hwNWZ4Znc3bm03MjZzbjI2M3EwZzNqb3EwaW91Ym5xYXQwdCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/vZFZFVYQvtdidWZltF/giphy.gif)

### Syntax is a language used to tell Alloy how you want it to collect, transform, and deliver your telemetry data. 
![Alt Text](https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExZWZnenp4bThzNzU1cW9oYTkzcW84am9keDRzem1kc2IzZTNlYTRoZyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/xTiTnuhyBF54B852nK/giphy.gif)

### Alloy configuration syntax consists of:
- Blocks
- Experssions
- Attributes

#### Blocks
<img width="345" alt="image" src="https://github.com/user-attachments/assets/3a38536c-77af-43e4-b931-293c15275377" />

You use Blocks to configure components and groups of attributes. Each block can contain any number of attributes or nested blocks. Blocks are steps in the overall pipeline expressed by the configuration.

Pattern for creating a labeled block:
```
BLOCK_NAME "BLOCK_LABEL" {
  // Block body can contain attributes and nested unlabeled blocks
  IDENTIFIER = EXPRESSION // Attribute

  NESTED_BLOCK_NAME {
    // Nested block body
  }
}

```
Example:
```
prometheus.remote_write "default" {
  endpoint {
    url = "http://localhost:9009/api/prom/push"
  }
}
```
The preceding example has two blocks:

- `prometheus.remote_write "default"`: A labeled block which instantiates a prometheus.remote_write component. The label is the string "default".
- `endpoint`: An unlabeled block inside the component that configures an endpoint to send metrics to. This block sets the url attribute to specify the endpoint.

#### Attributes
You use Attributes to configure individual settings. Attributes always take the form of `ATTRIBUTE_NAME = ATTRIBUTE_VALUE`.

<img width="909" alt="image" src="https://github.com/user-attachments/assets/675a6f27-654a-4d62-ae45-534da361a496" />

```
prometheus.scrape "infra" {
//The targets array allows us to specify which service targets to scrape from:
  targets = [
    {"__address__" = "grafana:3000", group = "infrastrcuture", service = "grafana"},
  ]

  scrape_interval = "15s"
  job_name        = "infra"
  forward_to    = [prometheus.remote)write.mimir.receiver]
}
```

#### Types 
<img width="913" alt="image" src="https://github.com/user-attachments/assets/56b63fcf-92b1-437c-ac69-2fdcc18bd4d8" />

#### Expressions and Operators 
You use expressions to compute the value of an attribute. The simplest expressions are constant values like `"debug"`, `32`, or `[1, 2, 3, 4]`. The Alloy syntax supports complex expressions, for example:

- Referencing the exports of components: `local.file.password_file.content`
- Mathematical operations: `1 + 2`, `3 * 4`, `(5 * 6) + (7 + 8)`
- Equality checks: `local.file.file_a.content == local.file.file_b.content`
- Calling functions from Alloy’s standard library: `sys.env("HOME")` retrieves the value of the `HOME` environment variable.

You can use expressions for any attribute inside a component definition.

#### Standard Library

![Alt Text](https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExODB6OXR3M3JpYzJ4aml1bW9meTU2N2IyazRxNjdxbzZtNmtkdnR3ZCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/128MHrlrHNwwU0/giphy.gif)

# Infrastructure Observability
# Application Observability
# Debugging
# Q & A
