# Building OpenTelemetry and Prometheus native telemetry pipelines with Grafana Alloy

<img width="916" alt="image" src="https://github.com/user-attachments/assets/8d60bee9-9d0f-4e9f-9d62-74d5f10a4ec5" />
<img width="908" alt="image" src="https://github.com/user-attachments/assets/00f99216-c190-4dd6-b2e6-78b4cfa58b44" />

## Resources for the workshop

- [Environment set up](https://github.com/grafana/intro-to-mltp)
- [Grafana Alloy documentation](https://grafana.com/docs/alloy/latest/)
- [Alloy configuration blocks](https://grafana.com/docs/alloy/latest/reference/config-blocks/)
- [Alloy components](https://grafana.com/docs/alloy/latest/reference/components/)

# Alloy 101 
<img width="909" alt="image" src="https://github.com/user-attachments/assets/d37cbbce-2526-443c-83e5-9c0a3a6b481d" />
<img width="911" alt="image" src="https://github.com/user-attachments/assets/d0f35b76-3aa0-48c6-8678-8310ffc29cdc" />
<img width="913" alt="image" src="https://github.com/user-attachments/assets/32c14388-b5e6-4fcb-ba62-c491729c5f2e" />
<img width="913" alt="image" src="https://github.com/user-attachments/assets/45bf6e1a-e3de-4809-809a-7268a8a6d367" />
<img width="911" alt="image" src="https://github.com/user-attachments/assets/80f3e603-dea7-48fe-80b5-7807431d85e2" />
<img width="917" alt="image" src="https://github.com/user-attachments/assets/0f5c80f3-0b18-45fa-8e4a-3c95a939859d" />
<img width="913" alt="image" src="https://github.com/user-attachments/assets/3aca8547-5d47-4b05-b624-297a1adda4e9" />
<img width="915" alt="image" src="https://github.com/user-attachments/assets/87e09054-937f-429e-a9e2-7167e1bf65ff" />

## Alloy vocabularies 

### Think of Alloy as our trusty pal who can collect, transform, and deliver our telemetry data. 

To instruct Alloy on how we want that done, we must write these instructions in a language (`Alloy syntax`) that Alloy understands. 

![Alt Text](https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExZWZnenp4bThzNzU1cW9oYTkzcW84am9keDRzem1kc2IzZTNlYTRoZyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/xTiTnuhyBF54B852nK/giphy.gif)

### Imagine that you are writing a set of to do lists for Alloy. 
<img width="731" alt="image" src="https://github.com/user-attachments/assets/3599a013-7c43-4e01-896d-78e5c9cf363b" />

A single task is known as a `component` in Alloy.

These components could be put together in any way to form a complete set of instructions on how to collect, transform, and deliver telemetry data. This set of instructions is known as a `pipeline` in Alloy. 

### Each task/component could be further broken down into a detailed set of instructions.
These subtasks/subcomponents are known as `blocks` in Alloy. 

<img width="729" alt="image" src="https://github.com/user-attachments/assets/ed8aa651-f522-45ea-9556-de943f4908f9" />

For example:
```
prometheus.remote_write "default" {
    endpoint {
        url = "http://localhost:9009/api/prom/push"
    }
}
```
The preceding example has two blocks:
- prometheus.remote_write "default": A labeled block which instantiates a `prometheus.remote_write` component. The label is the string "default".
- endpoint: An unlabeled `block` inside the component that configures an endpoint to send metrics to.
- Within `blocks`, you can further use `attributes` and `expressions` to give Alloy more information on what you would like it to do as a key-value pair. 
- You use `expressions` to compute or denote the value of an `attribute`. The simplest `expressions` are constant values like strings, integers, lists, objects, etc.
- This block sets the url `attribute`  equal to the value (`expression`) of the url ("http://localhost:9009/api/prom/push").

# Environment overview
<img width="1433" alt="image" src="https://github.com/user-attachments/assets/6fd37912-58ab-4620-a246-6babc04d8f5d" />

# Best practices for building pipelines with Alloy

*Whenever possible*
- We recommend Prometheus instrumentation for Infrastructure Observability and OTel instrumentation for Application Observability.
- We strongly recommend collecting all the telemetry types of a given monitored component using a single ecosystem: either Prometheus/Loki or OTel, but not a mix of both.

* Not every telemetry collection scenario is clear cut where you can perfectly follow these recommendations. In those cases, you will have to get telemetry however you can and connect the signals while mixing ecosystems. You will see an example of this in this workshop. 

# Infrastructure Observability
Prometheus/Promtail telemetry should be
- collected using Alloy prometheus.* , loki.* , and discovery.* components
- enriched using the Alloy Prometheus and Promtail/Loki components
- sent to Grafana Cloud using the Prometheus Remote Write and Loki Endpoints

## Hands on lab

Before getting started, make sure you:
- install [Docker](https://www.docker.com/products/docker-desktop/) and [DockerCompose](https://docs.docker.com/compose/install/) 
- clone the [repo](https://github.com/grafana/intro-to-mltp) for the demo environment :
```
git clone https://github.com/grafana/intro-to-mltp.git
```
- start a new command-line interface in your Operating System and run: 
```
docker compose up
```
### Common tasks
We will be using the `config.alloy` file to build pipelines for Infrastructure O11y and Applications O11y. 
Whenever we make changes to the file, we must reload the config. 

#### Reloading the config

To reload Alloy's config, hit the following endpoint in a browser or with a tool like `curl`:

```bash
curl -X POST http://localhost:12347/-/reload
```

If the config is valid, you should see a response like the following:

```
config reloaded
```

## Infrastructure Observability - collect, process, and export logs and metrics
### Section 1: Collect logs from Alloy and relabel logs

#### Objectives

- Collect logs from Alloy using the [`logging`](https://grafana.com/docs/alloy/latest/reference/config-blocks/logging/) block
- Use [`loki.relabel`](https://grafana.com/docs/alloy/latest/reference/components/loki/loki.relabel/) to add labels to the logs
- [Write](https://grafana.com/docs/alloy/latest/reference/components/loki/loki.write/) the logs to Loki

#### Instructions

Open `config.alloy` in your editor and copy the following code into it:

```alloy/config.alloy
logging {
    // TODO: Fill in this block
}

loki.relabel "alloy_logs" {
    // TODO: Fill in this component
}

loki.write "mythical" {
    // TODO: Fill in this component
}
```

For the `logging` block, we want to set the log format to "logfmt" and the log level to "debug" and write the logs to the `loki.relabel.alloy_logs` component's receiver.

For the `loki.relabel` component, we want to set the `group` label to "infrastructure" and the `service` label to "alloy" and forward the logs to the `loki.write.mythical` component's receiver.

For the `loki.write` component, we want to ship logs to `http://loki:3100/loki/api/v1/push`.

<img width="910" alt="image" src="https://github.com/user-attachments/assets/887f206b-683f-4107-aaf3-cb891c2226d1" />

Make sure to [reload the config](#reloading-the-config) after filling in the blocks!

#### Verification

To check that logs are being ingested, navigate to the [Grafana Explore Page](http://localhost:3000/explore), select the "Loki" data source, and run the following query:

```logql
{service="alloy"}
```

<img width="1436" alt="image" src="https://github.com/user-attachments/assets/80aea5e4-d25f-49f6-83ce-38d4911fe97d" />

### Section 2: Collect metrics from Loki

#### Objectives

- Collect metrics from Loki using the [`prometheus.scrape`](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.scrape/) component
- Use [`prometheus.remote_write`](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.remote_write/) to write the metrics to locally running Mimir

#### Instructions

Open `config.alloy` in your editor and copy the following code into it:

```alloy
prometheus.scrape "loki" {
    // These scrape intervals are set to 2 seconds for the workshop so we have very fast feedback, but you should use a more reasonable
    // scrape interval for production
    scrape_interval = "2s"
    scrape_timeout  = "2s"

    // TODO: Fill in the rest of this component
}

// Define the prometheus remote_write endpoint we'd like to write all Prometheus metrics to
prometheus.remote_write "mimir" {
    // TODO: Fill in this component
}
```

For the `prometheus.scrape` component, we can define scrape targets for Loki directly by creating a scrape object. Scrape targets are defined as a list of maps, where each map contains a `__address__` key with the address of the target to scrape. Any non-double-underscore keys are used as labels for the target.

For example, the following scrape object will scrape Mimir's metrics endpoint and add `env="demo"` and `service="mimir"` labels to the target:

```alloy
targets = [{"__address__" = "mimir:9009",  env = "demo", service = "mimir"}]
```

For the `prometheus.remote_write` component, the url we'd like to write metrics to is `http://mimir:9009/api/v1/push`.

<img width="914" alt="image" src="https://github.com/user-attachments/assets/8bca5fee-8dbb-4c01-8f45-9b2015183433" />

Don't forget to [reload the config](#reloading-the-config) after finishing.

#### Verification

To check that Loki's metrics are being ingested, navigate to the [Grafana Explore Page](http://localhost:3000/explore), select the "Mimir" data source, and run the following query:

```promql
rate(loki_distributor_bytes_received_total{job="prometheus.scrape.loki"}[$__rate_interval])
```

You should see values coming in for the logs we started ingesting in the previous section!

<img width="1438" alt="image" src="https://github.com/user-attachments/assets/5ab051a4-7d06-40f5-ac86-9dcc6fb13dce" />


### Section 3: Collect metrics from Alloy and relabel metrics 

#### Objectives

- Collect Alloy's own metrics using the [`prometheus.exporter.self`](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.exporter.self/) component
- Use [`prometheus.relabel`](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.relabel/) to add labels to the metrics
- [Write](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.remote_write/) the metrics to Mimir

#### Instructions

Open `config.alloy` in your editor and copy the following code into it:

```alloy
// This component exposes Alloy's own metrics endpoints in-memory, but it doesn't require an configuration
// so you are already done!
prometheus.exporter.self "alloy" {}

prometheus.scrape "alloy" {
    scrape_interval = "2s"
    scrape_timeout  = "2s"

    // TODO: Fill in the rest of this component
}

prometheus.relabel "alloy" {
    // TODO: Fill in this component
}
```

For this section, we would like to configure `prometheus.scrape.alloy` to scrape the `prometheus.exporter.self.alloy` component's targets and forward the metrics to the `prometheus.relabel.alloy` component's receiver.

For the `prometheus.relabel` component, we want to add the `group` label with the value "infrastructure" and the `service` label with the value "alloy" to the metrics.

<img width="914" alt="image" src="https://github.com/user-attachments/assets/13f26aa3-0f04-47fd-964f-807661037f6e" />

Don't forget to [reload the config](#reloading-the-config) after finishing.

#### Verification

To check that Alloy's metrics are being ingested, navigate to the [Grafana Explore Page](http://localhost:3000/explore), select the "Mimir" data source, and run the following query:

```promql
rate(alloy_resources_process_cpu_seconds_total{job="prometheus.scrape.alloy"}[$__rate_interval])
```

You should see Alloy's CPU usage metrics coming in.

<img width="1437" alt="image" src="https://github.com/user-attachments/assets/73cdefd8-ae2c-4222-9044-6e4f8325df78" />


### Section 4: Collect Postgres metrics

#### Objectives

- Collect metrics from Postgres using the [`prometheus.scrape`](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.scrape/) component
- Use [`prometheus.relabel`](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.relabel/) to add the `group="infrastructure"` and `service="postgres"` labels
- [Write](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.remote_write/) the metrics to Mimir

#### Instructions

Open `config.alloy` in your editor and copy the following code into it:

```alloy
prometheus.exporter.postgres "mythical" {
    data_source_names = ["postgresql://postgres:mythical@mythical-database:5432/postgres?sslmode=disable"]
}

prometheus.scrape "postgres" {
    scrape_interval = "2s"
    scrape_timeout  = "2s"

    // TODO: Fill in the rest of this component
}

// Relabel the metrics for postgres to include the 
prometheus.relabel "postgres" {
    // TODO: Fill in this component
}
```

For the `prometheus.scrape` component, we want to scrape the `prometheus.exporter.postgres.mythical` component's targets and forward the metrics to the `prometheus.relabel.postgres` component's receiver.

For the `prometheus.relabel` component, we want to add the `group="infrastructure"` and `service="postgres"` labels to the metrics.

<img width="917" alt="image" src="https://github.com/user-attachments/assets/9668a67c-5a6a-4676-aa0e-4fb3573a39eb" />

Don't forget to [reload the config](#reloading-the-config) after finishing.

#### Verification

To check that the Postgres metrics are being ingested, navigate to the [Dashboards](http://localhost:3000/dashboards) page and select the `PostgreSQL` dashboard. If you don't see the dashboard,
you can import it by clicking the `New` button on the top right, select `Import`, enter the dashboard ID `9628`, select the Mimir data source, and click `Import`.

You should see the panels in the Postgres dashboard populated with data.

<img width="1433" alt="image" src="https://github.com/user-attachments/assets/03cb88b9-ce15-44c0-a072-58d7609e3203" />

![Alt Text](https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExODN2dXRwNXo3dHl1enMyaXRqMjJjbTUxMGZmNnRldDJxcTJmdDB2OCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/UWF3nQFeXR30yjna2Q/giphy.gif)

## Application Observability - collect, process, and export traces and logs
### Section 5: Ingesting OTel traces

#### Objectives

- [Receive](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.receiver.otlp/) spans from the Mythical services and Beyla
- [Batch spans](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.processor.batch/) for efficient processing
- [Write](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.exporter.otlp/) the spans to a local instance of Tempo

#### Instructions

Open `config.alloy` in your editor and copy the following code into it:

```alloy
otelcol.receiver.otlp "otlp_receiver" {
    // TODO: Fill this component in
    output {
        traces = [
            // TODO: Fill this in
        ]
    }
}

otelcol.processor.batch "default" {
    // TODO: Fill this in
}

otelcol.exporter.otlp "tempo" {
    // TODO: Fill this in
    client {
        // TODO: Fill this in

        // This is a local instance of Tempo, so we can skip TLS verification
        tls {
            insecure             = true
            insecure_skip_verify = true
        }
    }
}
```

The batch processor will batch spans until a batch size or a timeout is met, before sending those batches on to another component. 
Let's configure it to batch minimum 1000 spans, up to 2000 spans, or until 2 seconds have elapsed.

The Tempo url is `http://tempo:4317`.

<img width="915" alt="image" src="https://github.com/user-attachments/assets/1e3dedbe-d69b-47b6-b7e0-ee3a2ae740e7" />

#### Verification

To check that traces are being ingested, navigate to the [Grafana Explore Page](http://localhost:3000/explore), select the "Tempo" data source, and run the following query:

```traceql
{span.beast="owlbear"}
```

You should see traces coming in for the Mythical services.

<img width="1433" alt="image" src="https://github.com/user-attachments/assets/a19d7895-c232-49d8-b907-c70924d99a22" />

You can also navigate to the [Dashboards list](http://localhost:3000/dashboards) and select the `MLT Dashboard` dashboard. These dashboards are configured to use the metrics
from Spanmetrics, so you should see data for the spans we're ingesting.

<img width="1434" alt="image" src="https://github.com/user-attachments/assets/73080e3d-5dc3-4013-9409-09cd9887d565" />

### Section 6: Spanlogs

#### Objectives

- Take the traces we're already ingesting and [convert them to logs (spanlogs)](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.connector.spanlogs/)
- [Convert](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.exporter.loki/) the logs to Loki-formatted log entries and forward them to the `loki.processor`. 
- Use [`loki.process`](https://grafana.com/docs/alloy/latest/reference/components/loki/loki.process/) to convert the format and add attributes to the logs
- Forward the processed logs to Loki

#### Instructions

Open `config.alloy` in your editor and copy the following code into it:
See notes below the code snippets for more detailed instructions.

```alloy
otelcol.connector.spanlogs "autologging" {
    // TODO: Fill this in
}

otelcol.exporter.loki "autologging" {
    // TODO: Fill this in
}

// The Loki processor allows us to accept a Loki-formatted log entry and mutate it into
// a set of fields for output.
loki.process "autologging" {
    stage.json {
        // TODO: Fill this in
    }

    stage.output {
        // TODO: Fill this in
    }

    stage.logfmt {
        // TODO: Fill this in
    }

    stage.labels {
        // TODO: Fill this in
    }

    forward_to = [loki.write.mythical.receiver]
}
```
**`otelcol.connector.spanlogs`**
For the `otelcol.connector.spanlogs` component to work, we will need to forward the spans from the `otelcol.receiver.otlp`'s output > traces we have defined in exercise 5 to the `otelcol.connector.spanlogs`'s input.

We'd like to make sure to only generate a log for each full trace(root), not for each span or process (that would be a lot of logs!).

We should also make sure to include the `http.method`, `http.target`, and `http.status_code` attributes in the logs.

Then send the generated logs to the `otelcol.exporter.loki`'s input. 

**`otelcol.exporter.loki`** 
This component accepts OTLP-formatted logs from other otelcol components and converts them to Loki-formatted log entries without further configuration. 

Forward the Loki-formatted logs to the `loki.process "autologging"`'s receiver for further processing. 

**loki.process**
Use this component to:
  - Convert the body from JSON to logfmt using the `stage.json` and `stage.logfmt` stages
  - Add the `method`, `status`, and `target` labels from the `http.method`, `http.status_code`, and `http.target` attributes

<img width="913" alt="image" src="https://github.com/user-attachments/assets/56125b64-effd-4965-9c41-9b27b9cbb21c" />

### Exercise: Ingesting application logs

### Exercise: Filtering logs

### Advanced Exercise: Spanmetrics in Alloy
