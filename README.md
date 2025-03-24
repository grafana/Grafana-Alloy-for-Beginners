<img width="916" alt="image" src="https://github.com/user-attachments/assets/8d60bee9-9d0f-4e9f-9d62-74d5f10a4ec5" />
<img width="913" alt="image" src="https://github.com/user-attachments/assets/dd978b03-74b9-456e-bedf-d24df79ff069" />
<img width="915" alt="image" src="https://github.com/user-attachments/assets/a5b22089-6037-4c88-afea-4e62c83a7960" />

# Resources for the workshop
- https://github.com/grafana/intro-to-mltp
- [Grafana Alloy documentation](https://grafana.com/docs/alloy/latest/) 

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

# Best practices for building pipelines with Alloy
### We recommend Prometheus instrumentation for Infrastructure Observability and OTel instrumentation for Application Observability,
### We strongly recommend collecting all the telemetry types of a given monitored component using one single ecosystem: either Prometheus/Loki or OTel, but not a mix of both.

# Infrastructure Observability
Prometheus telemetry should be
- collected using Alloy prometheus.* and discovery.* components
- enriched using the Alloy Prometheus components
- sent to Grafana Cloud using the Prometheus Remote Write

## Building a Prometheus pipeline for metrics 
### Before you begin, make sure: 
- you have basic familiarity with instrumenting applications with Prometheus.
- have a set of Prometheus exports or applications exposing Prometheus metrics that you want to collect metrics from.
- Identify where to write collected metrics.
  Metrics can be written to Prometheus or Prometheus-compatible endpoints such as Grafana Mimir, Grafana Cloud, or Grafana Enterprise Metrics.

### Components used in this section: 
- [prometheus.remote_write](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.remote_write/)
- [prometheus.scrape](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.scrape/)

### Configure metrics delivery 

Before components can collect Prometheus metrics, you must have a component responsible for writing those metrics somewhere.

The `prometheus.remote_write` component is responsible for delivering Prometheus metrics to one or more Prometheus-compatible endpoints. After a prometheus.remote_write component is defined, you can use other Alloy components to forward metrics to it.

To configure a prometheus.remote_write component for metrics delivery, complete the following steps:

#### Step 1: Add the following prometheus.remote_write component to your configuration file.
```
prometheus.remote_write "<LABEL>" {
  endpoint {
    url = "<PROMETHEUS_URL>"
  }
}
```
Replace the follwing: 

- <LABEL>: The label for the component, such as default. The label you use must be unique across all prometheus.remote_write components in the same configuration file.
- <PROMETHEUS_URL> The full URL of the Prometheus-compatible endpoint where metrics are sent, such as https://prometheus-us-central1.grafana.net/api/v1/write for Prometheus or https://mimir-us-central1.grafana.net/api/v1/push/ for Mimir. The endpoint URL depends on the database you use.

#### Step 2: If your endpoint requires basic authentication, paste the following inside the endpoint block.
```
basic_auth {
  username = "<USERNAME>"
  password = "<PASSWORD>"
}
```
Replace the following:

- <USERNAME>: The basic authentication username.
- <PASSWORD>: The basic authentication password or API key.

*If you have more than one endpoint to write metrics to, repeat the endpoint block for additional endpoints.*

#### Example
```
prometheus.remote_write "default" {
  endpoint {
    url = "http://localhost:9090/api/prom/push"
  }

  endpoint {
    url = "https://prometheus-us-central1.grafana.net/api/prom/push"

    // Get basic authentication based on environment variables.
    basic_auth {
      username = sys.env("<REMOTE_WRITE_USERNAME>")
      password = sys.env("<REMOTE_WRITE_PASSWORD>")
    }
  }
}

prometheus.scrape "example" {
  // Collect metrics from the default listen address.
  targets = [{
    __address__ = "127.0.0.1:12345",
  }]

  forward_to = [prometheus.remote_write.default.receiver]
}
```
# Application Observability

OTel telemetry should be
- collected using OTel SDKs and OTel Collector Receivers
- enriched and exported using OTel Collector processors, connectors, and exporters
- sent to Grafana Cloud using the Grafana Cloud OTLP Endpoint

## Building OTel pipeliens for metrics,logs, and traces

### Before you begin, make sure: 
- ensure that you have basic familiarity with instrumenting applications with OTel.
- identify where Alloy writes received telemetry data.

### Components used in this section
- [otelcol.auth.basic](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.auth.basic/)
- [otelcol.exporter.otlp](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.exporter.otlp/)
- [otelcol.exporter.otlphttp](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.exporter.otlphttp/)
- [otelcol.processor.batch](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.processor.batch/)
- [otelcol.exporter.otlp](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.receiver.otlp/)

### Pipeline overview
Metrics, Logs, Traces: OTLP Receiver → batch processor → OTLP Exporter

### Configure an OpenTelemtry Protocol exporter 
Before components can receive OTel data, you must have a component responsible for writing (exporting) the OTel data to an external system.

Use the `otelcol.exporter.otlp` component to send OTel data to a server using the OTel Protocol (OTLP). After an exporter component is defined, you can use other Alloy components to forward data to it.

To configure an `otelcol.exporter.otlp` component for exporting OTel data using OTLP, complete the following steps:
#### Step 1: Add the following otelcol.exporter.otlp component to your configuration file:
```
otelcol.exporter.otlp "<EXPORTER_LABEL>" {
  client {
    endpoint = "<HOST>:<PORT>"
  }
}
```
Replace the following:
- `<EXPORTER_LABEL>`: The label for the component, such as `default`. The label you use must be unique across all `otelcol.exporter.otlp` components in the same configuration file.
- `<HOST>`: The hostname or IP address of the server to send OTLP requests to.
- `<PORT>`: The port of the server to send OTLP requests to.

#### Step 2: If your server requires basic authentication, complete the following:

Add the following otelcol.auth.basic component to your configuration file:
```
otelcol.auth.basic "<BASIC_AUTH_LABEL>" {
  username = "<USERNAME>"
  password = "<PASSWORD>"
}
```
Replace the following: 
- *<BASIC_AUTH_LABEL>*: The label for the *otelcol.auth.basic* component.

If you have more than one server to export metrics to, create an `otelcol.exporter.otlp` component for each additional server.

NOTE:
`otelcol.exporter.otlp` sends data using OTLP over gRPC (HTTP/2). To send to a server using HTTP/1.1, follow the preceding steps, but use the `otelcol.exporter.otlphttp` component instead.

Example:
The following example demonstrates configuring otelcol.exporter.otlp with authentication and a component that forwards data to it:
```
otelcol.exporter.otlp "default" {
  client {
    endpoint = "my-otlp-grpc-server:4317"
    auth     = otelcol.auth.basic.credentials.handler
  }
}

otelcol.auth.basic "credentials" {
  // Retrieve credentials using environment variables.

  username = sys.env("BASIC_AUTH_USER")
  password = sys.env("API_KEY")
}

otelcol.receiver.otlp "example" {
  grpc {
    endpoint = "127.0.0.1:4317"
  }

  http {
    endpoint = "127.0.0.1:4318"
  }

  output {
    metrics = [otelcol.exporter.otlp.default.input]
    logs    = [otelcol.exporter.otlp.default.input]
    traces  = [otelcol.exporter.otlp.default.input]
  }
}
```
### Data Transformation
Production-ready Alloy configurations shouldn’t send OTel data directly to an exporter for delivery. Instead, data is usually sent to one or more processor components that perform various transformations on the data.

`otelcol.processor` components are used to process Opentelemtry data. 

#### Configure batching
Ensuring data is batched is a production-readiness step to improve data compression and reduce the number of outgoing network requests to external systems.

In this task, you configure an `otelcol.processor.batch` component to batch data before sending it to the exporter.

To configure an `otelcol.processor.batch` component, complete the following steps:

Add the following   otelcol.processor.batch   component into your configuration file: 
```
otelcol.processor.batch "<PROCESSOR_LABEL>" {
  output {
    metrics = [otelcol.exporter.otlp.<EXPORTER_LABEL>.input]
    logs    = [otelcol.exporter.otlp.<EXPORTER_LABEL>.input]
    traces  = [otelcol.exporter.otlp.>EXPORTER_LABEL>.input]
  }
}
```
Replace the following:

- `<PROCESSOR_LABEL>`: The label for the component, such as default. The label you use must be unique across all otelcol.processor.batch components in the same configuration file.
- `<EXPORTER_LABEL>`: The label for your otelcol.exporter.otlp component.

To disable one of the telemetry types, set the relevant type in the `output` block to the empty list, such as `metrics = []`.
To send batched data to another processor, replace the components in the output list with the processor components to use.

Example:
The following example demonstrates configuring a sequence of otelcol.processor components before being exported.
```
otelcol.processor.memory_limiter "default" {
  check_interval = "1s"
  limit          = "1GiB"

  output {
    metrics = [otelcol.processor.batch.default.input]
    logs    = [otelcol.processor.batch.default.input]
    traces  = [otelcol.processor.batch.default.input]
  }
}

otelcol.processor.batch "default" {
  output {
    metrics = [otelcol.exporter.otlp.default.input]
    logs    = [otelcol.exporter.otlp.default.input]
    traces  = [otelcol.exporter.otlp.default.input]
  }
}

otelcol.exporter.otlp "default" {
  client {
    endpoint = "my-otlp-grpc-server:4317"
  }
}
```

### Configure an OTel Protocol receiver 
You can configure Alloy to receive OTel metrics, logs, and traces. An OTel receiver component is responsible for receiving OTel data from an external system.

In this task, you use the otelcol.receiver.otlp component to receive OTel data over the network using the OTel Protocol (OTLP). You can configure a receiver component to forward received data to other Alloy components.

To configure an `otelcol.receiver.otlp` component for receiving OTLP data, complete the following steps:

- Follow Configure an OpenTelemetry Protocol exporter to ensure received data can be written to an external system.
- Optional: Follow Configure batching to improve compression and reduce the total amount of network requests.
- Add the following `otelcol.receiver.otlp` component to your configuration file.

```
otelcol.receiver.otlp "<LABEL>" {
  output {
    metrics = [<COMPONENT_INPUT_LIST>]
    logs    = [<COMPONENT_INPUT_LIST>]
    traces  = [<COMPONENT_INPUT_LIST>]
  }
}
```
Replace the following:

- `<LABEL>`: The label for the component, such as default. The label you use must be unique across all `otelcol.receiver.otlp` components in the same configuration file.
- `<COMPONENT_INPUT_LIST>`: A comma-delimited list of component inputs to forward received data to. For example, to send data to a batch processor component, use `otelcol.processor.batch.PROCESSOR_LABEL.input`. To send data directly to an exporter component, use `otelcol.exporter.otlp.EXPORTER_LABEL.input`.

To allow applications to send OTLP data over gRPC on port `4317`, add the following to your otelcol.receiver.otlp component.
```
grpc {
  endpoint = "<HOST>:4317"
}
```
Replace the following:
- `<HOST>`: A host to listen to traffic on. Use a narrowly scoped listen address whenever possible. To listen on all network interfaces, replace `<HOST>` with `0.0.0.0`.

To allow applications to send OTLP data over HTTP/1.1 on port `4318`, add the following to your `otelcol.receiver.otlp` component.
```
http {
  endpoint = "<HOST>:4318"
}
```
Replace the following:
- `<HOST>`: The host to listen to traffic on. Use a narrowly scoped listen address whenever possible. To listen on all network interfaces, replace `<HOST>` with `0.0.0.0`.

To disable one of the telemetry types, set the relevant type in the `output` block to the empty list, such as `metrics = []`.

The following example demonstrates configuring `otelcol.receiver.otlp` and sending it to an exporter

```
otelcol.receiver.otlp "example" {
  grpc {
    endpoint = "127.0.0.1:4317"
  }

  http {
    endpoint = "127.0.0.1:4318"
  }

  output {
    metrics = [otelcol.processor.batch.example.input]
    logs    = [otelcol.processor.batch.example.input]
    traces  = [otelcol.processor.batch.example.input]
  }
}

otelcol.processor.batch "example" {
  output {
    metrics = [otelcol.exporter.otlp.default.input]
    logs    = [otelcol.exporter.otlp.default.input]
    traces  = [otelcol.exporter.otlp.default.input]
  }
}

otelcol.exporter.otlp "default" {
  client {
    endpoint = "my-otlp-grpc-server:4317"
  }
}
```

### Forwarding OTel data to Grafana

#### Grafana Cloud 

Grafana Cloud provides OTLP Endpoints that you can use directly from within Alloy.

You can find the OTLP connection details from the OpenTelemetry Details page in the Grafana Cloud Portal.

You must update the configuration file as follows:
```
otelcol.auth.basic "default" {
  username = "<ACCOUNT ID>"
  password = "<API TOKEN>"
}

otelcol.exporter.otlphttp "default" {
  client {
    endpoint = "<OTLP_ENDPOINT>"
    auth     = otelcol.auth.basic.default.handler
  }
}
```
Replace the following:

- `<ACCOUNT ID>`: Your Grafana Cloud account ID.
- `<API TOKEN>`: Your Grafana Cloud API token.
- `<OTLP_ENDPOINT>`: Your OTLP endpoint.
  
This configuration uses the credentials stored in `otelcol.auth.basic` "default" to authenticate against the Grafana Cloud OTLP endpoints, and you should start to see your data arrive.

#### Other platforms (Grafana Enterprise, Grafana Open Source)
You can implement the following pipelines to send your data to Loki, Tempo, and Mimir or Prometheus.

Metrics:
OTel → batch processor → Mimir or Prometheus remote write

Logs: 
OTel → batch processor → Loki exporter

Traces: 
OTel → batch processor → OTel exporter

**Grafana Loki**

Grafana Loki is a horizontally scalable, highly available, multi-tenant log aggregation system inspired by Prometheus. Similar to Prometheus, to send from OTLP to Loki, you can configure pass-through from the [otelcol.exporter.loki](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.exporter.loki/) component to [loki.write](https://grafana.com/docs/alloy/latest/reference/components/loki/loki.write/) component.

```
otelcol.exporter.loki "default" {
  forward_to = [loki.write.default.receiver]
}

loki.write "default" {
  endpoint {
    url = "http://loki-endpoint:8080/loki/api/v1/push"
        }
}
```
To use Loki with basic-auth, which is required with Grafana Cloud Logs, you must configure the loki.write component. You can get the Loki configuration from the Loki Details page in the Grafana Cloud Portal.

```
otelcol.exporter.loki "grafana_cloud_logs" {
  forward_to = [loki.write.grafana_cloud_logs.receiver]
}

loki.write "grafana_cloud_logs" {
  endpoint {
    url = "https://logs-prod-us-central1.grafana.net/loki/api/v1/push"

    basic_auth {
      username = "5252"
      password = sys.env("GRAFANA_CLOUD_API_KEY")
    }
  }
}
```
**Grafana Tempo**
Grafana Tempo is an open source, easy-to-use, scalable distributed tracing backend. Tempo can ingest OTLP directly, and you can use the OTLP exporter to send the traces to Tempo.
```
otelcol.exporter.otlp "default" {
  client {
    endpoint = "tempo-server:4317"
  }
}
```
To use Tempo with basic-auth, which is required with Grafana Cloud Traces, you must use the otelcol.auth.basic component. You can get the Tempo configuration from the Tempo Details page in the Grafana Cloud Portal.

```
otelcol.exporter.otlp "grafana_cloud_traces" {
  client {
    endpoint = "tempo-us-central1.grafana.net:443"
    auth     = otelcol.auth.basic.grafana_cloud_traces.handler
  }
}

otelcol.auth.basic "grafana_cloud_traces" {
  username = "4094"
  password = sys.env("GRAFANA_CLOUD_API_KEY")
}
```

**Grafana Mimir or Prometheus Remote Write**

Prometheus Remote Write is a popular metrics transmission protocol supported by most metrics systems, including Grafana Mimir and Grafana Cloud. To send from OTLP to a Prometheus compatible remote_write endpoint, you can configure pass-through from the otelcol.exporter.prometheus to the prometheus.remote_write component. The Prometheus remote write component in Alloy is a robust protocol implementation, including a Write Ahead Log (WAL) for resiliency.

```
otelcol.exporter.prometheus "default" {
  forward_to = [prometheus.remote_write.default.receiver]
}

prometheus.remote_write "default" {
  endpoint {
    url = "http://prometheus:9090/api/v1/write"
  }
}
```
To use Prometheus with basic-auth, which is required with Grafana Cloud Metrics, you must configure the prometheus.remote_write component. You can get the Prometheus configuration from the Prometheus Details page in the Grafana Cloud Portal.

```
otelcol.exporter.prometheus "grafana_cloud_metrics" {
        forward_to = [prometheus.remote_write.grafana_cloud_metrics.receiver]
    }

prometheus.remote_write "grafana_cloud_metrics" {
    endpoint {
        url = "https://prometheus-us-central1.grafana.net/api/prom/push"

        basic_auth {
            username = "12690"
            password = sys.env("GRAFANA_CLOUD_API_KEY")
        }
    }
}
```

### Final configuration

```
otelcol.receiver.otlp "example" {
  grpc {
    endpoint = "127.0.0.1:4317"
  }

  http {
    endpoint = "127.0.0.1:4318"
  }

  output {
    metrics = [otelcol.processor.batch.example.input]
    logs    = [otelcol.processor.batch.example.input]
    traces  = [otelcol.processor.batch.example.input]
  }
}

otelcol.processor.batch "example" {
  output {
    metrics = [otelcol.exporter.prometheus.grafana_cloud_metrics.input]
    logs    = [otelcol.exporter.loki.grafana_cloud_logs.input]
    traces  = [otelcol.exporter.otlp.grafana_cloud_traces.input]
  }
}

otelcol.exporter.otlp "grafana_cloud_traces" {
  client {
    endpoint = "tempo-us-central1.grafana.net:443"
    auth     = otelcol.auth.basic.grafana_cloud_traces.handler
  }
}

otelcol.auth.basic "grafana_cloud_traces" {
  username = "4094"
  password = sys.env("GRAFANA_CLOUD_API_KEY")
}

otelcol.exporter.prometheus "grafana_cloud_metrics" {
        forward_to = [prometheus.remote_write.grafana_cloud_metrics.receiver]
    }

prometheus.remote_write "grafana_cloud_metrics" {
    endpoint {
        url = "https://prometheus-us-central1.grafana.net/api/prom/push"

        basic_auth {
            username = "12690"
            password = sys.env("GRAFANA_CLOUD_API_KEY")
        }
    }
}

otelcol.exporter.loki "grafana_cloud_logs" {
  forward_to = [loki.write.grafana_cloud_logs.receiver]
}

loki.write "grafana_cloud_logs" {
  endpoint {
    url = "https://logs-prod-us-central1.grafana.net/loki/api/v1/push"

    basic_auth {
      username = "5252"
      password = sys.env("GRAFANA_CLOUD_API_KEY")
    }
  }
}
```

### Checking the pipeline graphically
Visit http://localhost:12345/graph

<img width="569" alt="image" src="https://github.com/user-attachments/assets/a847e435-b9f0-49ad-8bb2-d465805eb340" />


### Spanmetrics 
<img width="910" alt="image" src="https://github.com/user-attachments/assets/c96cf3c4-1431-4abe-a29d-fd0e9ccf7fe1" />



# Debugging
# Q & A
![Alt Text](https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExMXU1ZnNwazRmbXdmcGMzZmNueWd3eTk4aWJlNmI0dHd6OXR5azh3aCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/xT5LMB2WiOdjpB7K4o/giphy.gif)
