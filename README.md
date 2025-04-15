# Building OpenTelemetry and Prometheus native telemetry pipelines with Grafana Alloy

<img width="917" alt="image" src="https://github.com/user-attachments/assets/9217f310-39c8-4baa-b748-0a19cc40a5ba" />
<img width="912" alt="image" src="https://github.com/user-attachments/assets/6cc578a3-2531-41e2-aecc-bd505fd39b49" />
<img width="908" alt="image" src="https://github.com/user-attachments/assets/b78295bf-05a8-4d33-93af-14ccdd7ece68" />
<img width="911" alt="image" src="https://github.com/user-attachments/assets/d99b36ec-9c1b-48d5-b058-742ad0aff0c8" />

## Resources for the workshop

- [Environment set up](https://github.com/grafana/intro-to-mltp)
- [Endpoints needed for the workshop](https://github.com/grafana/intro-to-mltp/blob/main/alloy/endpoints.json)
- [Grafana Alloy documentation](https://grafana.com/docs/alloy/latest/)
- [Alloy configuration blocks](https://grafana.com/docs/alloy/latest/reference/config-blocks/)
- [Alloy components](https://grafana.com/docs/alloy/latest/reference/components/)

<img width="912" alt="image" src="https://github.com/user-attachments/assets/bc1467ea-b76b-4a8f-97af-91de818b07b6" />

## Environment set up
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
# Alloy 101 
<img width="909" alt="image" src="https://github.com/user-attachments/assets/d37cbbce-2526-443c-83e5-9c0a3a6b481d" />
<img width="911" alt="image" src="https://github.com/user-attachments/assets/d0f35b76-3aa0-48c6-8678-8310ffc29cdc" />
<img width="908" alt="image" src="https://github.com/user-attachments/assets/d2497157-e1ae-466a-8206-3fcf5dbb1616" />
<img width="911" alt="image" src="https://github.com/user-attachments/assets/f2aca8c7-a63c-4735-aceb-c5f64155cefc" />
<img width="912" alt="image" src="https://github.com/user-attachments/assets/85f2ea42-93d3-4477-be06-edaf84af1800" />
<img width="907" alt="image" src="https://github.com/user-attachments/assets/d669cbc0-dad6-4997-99dc-fed755b3c295" />
<img width="916" alt="image" src="https://github.com/user-attachments/assets/8e8422f6-205b-46e0-b19c-09eb4dbebd31" />
<img width="915" alt="image" src="https://github.com/user-attachments/assets/87e09054-937f-429e-a9e2-7167e1bf65ff" />

## Alloy syntax

### Think of Alloy as our trusty pal who can collect, transform, and deliver our telemetry data. 

To instruct Alloy on how we want that done, we must write these instructions in a language (`Alloy syntax`) that Alloy understands. 

![Alt Text](https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExZWZnenp4bThzNzU1cW9oYTkzcW84am9keDRzem1kc2IzZTNlYTRoZyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/xTiTnuhyBF54B852nK/giphy.gif)

### Imagine that you are writing a set of to do lists for Alloy. 
<img width="723" alt="image" src="https://github.com/user-attachments/assets/62cb6b85-81c5-4be0-953a-8c4b94132234" />

A single task is known as a `component` in Alloy.

These components could be put together in any way to form a complete set of instructions on how to collect, transform, and deliver telemetry data. This set of instructions is known as a `pipeline` in Alloy. 

### Each task/component could be further broken down into a detailed set of instructions.
These subtasks/subcomponents are known as `blocks` in Alloy. 

<img width="729" alt="image" src="https://github.com/user-attachments/assets/ed8aa651-f522-45ea-9556-de943f4908f9" />

<img width="949" alt="image" src="https://github.com/user-attachments/assets/67179581-8c0b-4ec6-8d9e-96256aeb1828" />

- prometheus.remote_write "default": A labeled block which instantiates a `prometheus.remote_write` component. The label is the string "default".
- endpoint: An unlabeled `block` inside the component that configures an endpoint to send metrics to.
  
<img width="950" alt="image" src="https://github.com/user-attachments/assets/17eb8490-6835-442e-ad46-332a0b856e43" />

- You use `expressions` to compute or denote the value of an `attribute`. The simplest `expressions` are constant values like strings, integers, lists, objects, etc.
- This block sets the url `attribute`  equal to the value (`expression`) of the url ("http://localhost:9009/api/prom/push").

<img width="943" alt="image" src="https://github.com/user-attachments/assets/ef5fc206-f425-4e04-aa83-d6aafd0bdcf0" />

- This is a very common pattern you’ll see for Prometheus and Loki pipelines.
- You have one component that exposes targets for a scraping component (`source` in the Loki component world) to scrape and forward telemetry to a prometheus.remote_write or loki.write component’s receiver

# Hands on lab

## Best practices for building pipelines with Alloy
*Whenever possible*
- We recommend Prometheus instrumentation for Infrastructure Observability and OTel instrumentation for Application Observability.
- We strongly recommend collecting all the telemetry types of a given monitored component using a single ecosystem: either Prometheus/Loki or OTel, but not a mix of both.

*Not every telemetry collection scenario is clear cut where you can perfectly follow these recommendations. In those cases, you will have to get telemetry however you can and connect the signals while mixing ecosystems. You will see an example of this in this workshop.* 

## Lab environment overview
<img width="1433" alt="image" src="https://github.com/user-attachments/assets/6fd37912-58ab-4620-a246-6babc04d8f5d" />

## Common tasks
We will be using the `config.alloy` file to build pipelines for Infrastructure O11y and Applications O11y. 
Whenever we make changes to the file, we must reload the config. 

### Reloading the config

To reload Alloy's config, hit the following endpoint in a browser or with a tool like `curl`:

```bash
curl -X POST http://localhost:12347/-/reload
```

If the config is valid, you should see a response like the following:

```
config reloaded
```
## Infrastructure O11y - collect, process, and export logs and metrics
Prometheus/Promtail telemetry should be
- collected using Alloy prometheus.* , loki.* , and discovery.* components
- enriched using the Alloy Prometheus and Promtail/Loki components
- sent to Grafana Cloud using the Prometheus Remote Write and Loki Endpoints

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

### Section 2: Collect metrics from Alloy and relabel metrics 

#### Objectives

- Collect Alloy's own metrics using the [`prometheus.exporter.self`](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.exporter.self/) component
- Use [`prometheus.relabel`](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.relabel/) to add labels to the metrics
- Use [`prometheus.remote_write`](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.remote_write/)to write the metrics to the locally running Mimir

#### Instructions

Open `config.alloy` in your editor and copy the following code into it:

```alloy
// This component exposes Alloy's own metrics endpoints in-memory, but it doesn't require a configuration
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

prometheus.remote_write "mimir" {
    endpoint {
        url = "http://mimir:9009/api/v1/push" 
    }
}
```

For this section, we would like to configure `prometheus.scrape.alloy` to scrape the `prometheus.exporter.self.alloy` component's targets and forward the metrics to the `prometheus.relabel.alloy` component's receiver.

For the `prometheus.relabel` component, we want to add the `group` label with the value "infrastructure" and the `service` label with the value "alloy" to the metrics.

Configure the 'prometheus.remote_write` component to write the metrics to a local Mimir database. 

<img width="913" alt="image" src="https://github.com/user-attachments/assets/0b1627de-e289-4d8f-8bf0-f836d18afc9e" />


Don't forget to [reload the config](#reloading-the-config) after finishing.

#### Verification

To check that Alloy's metrics are being ingested, navigate to the [Grafana Explore Page](http://localhost:3000/explore), select the "Mimir" data source, and run the following query:

```promql
rate(alloy_resources_process_cpu_seconds_total[$__rate_interval])
```

You should see Alloy's CPU usage metrics coming in.

<img width="912" alt="image" src="https://github.com/user-attachments/assets/af7f2de7-69dc-4caa-98d9-bcf4d0cdae5c" />

### Section 3: Collect metrics from Loki

#### Objectives

- Collect metrics from Loki using the [`prometheus.scrape`](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.scrape/) component
- [Write](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.remote_write/) metrics to locally running Mimir

#### Instructions

Open `config.alloy` in your editor and copy the following code into it:

```alloy
prometheus.scrape "loki" {
    // These scrape intervals are set to 2 seconds for the workshop, so we have very fast feedback, but you should use a more reasonable
    // scrape interval for production
    scrape_interval = "2s"
    scrape_timeout  = "2s"

    // TODO: Fill in the rest of this component
}

```

For the `prometheus.scrape` component, we can define scrape targets for Loki directly by creating a scrape object. Scrape targets are defined as a list of maps, where each map contains a `__address__` key with the address of the target to scrape. Any non-double-underscore keys are used as labels for the target.

For example, the following scrape object will scrape Mimir's metrics endpoint and add `env="demo"` and `service="mimir"` labels to the target:

```alloy
targets = [{"__address__" = "mimir:9009",  env = "demo", service = "mimir"}]
```

Forward the logs to the `prometheus.remote_write` component we defined in the previous section. 

<img width="914" alt="image" src="https://github.com/user-attachments/assets/a69bb312-d41c-4556-9ca7-52e23513e86e" />

Don't forget to [reload the config](#reloading-the-config) after finishing.

#### Verification

To check that Loki's metrics are being ingested, navigate to the [Grafana Explore Page](http://localhost:3000/explore), select the "Mimir" data source, and run the following query:

```promql
rate(loki_distributor_bytes_received_total[$__rate_interval])
```

You should see values coming in for the logs we started ingesting in the previous section!

<img width="915" alt="image" src="https://github.com/user-attachments/assets/bf1888de-6b2b-4c98-a1e4-0fa8e21c5e39" />
<img width="915" alt="image" src="https://github.com/user-attachments/assets/1be80ba8-1015-4185-b074-426443c5c3eb" />
<img width="911" alt="image" src="https://github.com/user-attachments/assets/8d8270f6-b0ef-49f1-a92a-d76c2fdda557" />
<img width="913" alt="image" src="https://github.com/user-attachments/assets/1fca692b-de54-4342-a4f1-35a0f385048c" />


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

<img width="908" alt="image" src="https://github.com/user-attachments/assets/dbdcae6d-97b1-402c-bdfd-53afdc2dfb5b" />

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

Don't forget to [reload the config](#reloading-the-config) after finishing.

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

**`loki.process`**

Use this component to:
  - Convert the body from JSON to logfmt using the `stage.json` and `stage.logfmt` stages
  - Add the `method`, `status`, and `target` labels from the `http.method`, `http.status_code`, and `http.target` attributes

<img width="913" alt="image" src="https://github.com/user-attachments/assets/56125b64-effd-4965-9c41-9b27b9cbb21c" />

Don't forget to [reload the config](#reloading-the-config) after finishing.

#### Verification

To check that spanlogs are being ingested, navigate to the [Grafana Explore Page](http://localhost:3000/explore), select the "Loki" data source, and run the following query:

```logql
{status="200"}
```
You should see spanlogs coming in for the Mythical services.
<img width="911" alt="image" src="https://github.com/user-attachments/assets/d0f14815-ced1-47ae-8d28-30018b16f9cc" />

### Exercise: Ingesting application logs
<img width="915" alt="image" src="https://github.com/user-attachments/assets/f5f2384a-35b4-4796-89a5-d3a0f2598327" />
<img width="913" alt="image" src="https://github.com/user-attachments/assets/8b8afaa5-ade1-4c5a-9935-6ccb607af0f9" />
<img width="913" alt="image" src="https://github.com/user-attachments/assets/4bbea9f2-28a4-4cb4-9a5b-fabe4e848fc6" />

#### Objectives

- Ingest application logs sent from the mythical services
- Process the log and add the `endpoint`, `method`, and `status` labels
- Print the logs to the console
- Forward the processed logs to Loki

#### Instructions

For this exercise, you may find the following components useful:

- [loki.source.api](https://grafana.com/docs/alloy/latest/reference/components/loki/loki.source.api/)
- [loki.process](https://grafana.com/docs/alloy/latest/reference/components/loki/loki.process/)
- [loki.write](https://grafana.com/docs/alloy/latest/reference/components/loki/loki.write/)
- [loki.echo](https://grafana.com/docs/alloy/latest/reference/components/loki/loki.echo/)

#### Verification

To check that the logs are being ingested, navigate to the [Grafana Explore Page](http://localhost:3000/explore), select the "Loki" data source, and run the following query:

```logql
{status="SUCCESS"}
```

You should see logs coming in for the Mythical services.

### Exercise: Filtering logs
<img width="914" alt="image" src="https://github.com/user-attachments/assets/e98e7dea-9b55-40a1-9630-0df54c42a2e0" />
<img width="912" alt="image" src="https://github.com/user-attachments/assets/9c9ca47a-a7a1-4d39-ab50-913968ac0391" />

You may have noticed that some of the logs contain a token that we don't want to store in Loki. For this exercise, let's use Alloy to redact
tokens from the logs.

#### Objectives

This exercise is more open-ended, but the goal is to redact the token from the logs before they are forwarded to Loki.

#### Verification

To check that the logs are being ingested but the token is being redacted, navigate to the [Grafana Explore Page](http://localhost:3000/explore), select the "Loki" data source, and run the following query:

```logql
{status="SUCCESS"}
```

You should see logs coming in for the Mythical services, but the token should be redacted.


### Advanced Exercise: Spanmetrics in Alloy
<img width="917" alt="image" src="https://github.com/user-attachments/assets/98c809e5-ae52-40b1-9ff2-198b018bf565" />

#### Objectives

- Use the `otelcol.processor.spanmetrics` component to generate metrics from the spans we're already ingesting
- Use the `otelcol.exporter.otlphttp` component to forward the metrics to Mimir, which can ingest OTLP-formatted metrics

#### Instructions

We first will have to `docker compose down` to stop the existing containers, as Tempo needs to be updated to stop generating spanmetrics.

Open `tempo/tempo.yaml` and replace the `metrics_generator` section with the following configuration:

```yaml
# Configures the metrics generator component of Tempo.
metrics_generator:
  # Specifies which processors to use.
  processor:
    # Span metrics create metrics based on span type, duration, name and service.
    span_metrics:
        # Configure extra dimensions to add as metric labels.
        dimensions:
          - http.method
          - http.target
          - http.status_code
          - service.version
    # Service graph metrics create node and edge metrics for determinng service interactions.
    service_graphs:
        # Configure extra dimensions to add as metric labels.
        dimensions:
          - http.method
          - http.target
          - http.status_code
          - service.version
    # Configure the local blocks processor.
    local_blocks:
        # Ensure that metrics blocks are flushed to storage so TraceQL metrics queries against historical data.
        flush_to_storage: true
  # The registry configuration determines how to process metrics.
  registry:
    collection_interval: 5s                 # Create new metrics every 5s.
    # Configure extra labels to be added to metrics.
    external_labels:
      source: tempo                         # Add a `{source="tempo"}` label.
      group: 'mythical'                     # Add a `{group="mythical"}` label.
  # Configures where the store for metrics is located.
  storage:
    # WAL for metrics generation.
    path: /tmp/tempo/generator/wal
    # Where to remote write metrics to.
    remote_write:
      - url: http://mimir:9009/api/v1/push  # URL of locally running Mimir instance.
        send_exemplars: true # Send exemplars along with their metrics.
  traces_storage:
    path: /tmp/tempo/generator/traces

# Global override configuration.
overrides:
  metrics_generator_processors: ['service-graphs', 'local-blocks'] # The types of metrics generation to enable for each tenant.
```

Then, restart all of the containers with `docker compose up`.

Finally, open `config.alloy` and add the following code to it:

```alloy
otelcol.processor.spanmetrics "spanmetrics" {
    // TODO: Fill this in
}

otelcol.exporter.otlphttp "mimir" {
    // TODO: Fill this in
}
```

#### Verification

To check that the spanmetrics are being ingested, navigate to the [Grafana Dashboards](http://localhost:3000/dashboards) page and select the `MLT Dashboard` dashboard.

You should see the panels in the MLT Dashboard populated with data.

### Recap
<img width="913" alt="image" src="https://github.com/user-attachments/assets/54fee4bc-cf61-4d3f-9ac1-4521e98fe0d2" />
<img width="910" alt="image" src="https://github.com/user-attachments/assets/ea859dc2-e88c-43f9-a9db-302dde2b2bb9" />

# Debugging
<img width="909" alt="image" src="https://github.com/user-attachments/assets/8f97d371-d234-48be-b948-1577cdb0f0e7" />

# Q & A
![Alt Text](https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExMXU1ZnNwazRmbXdmcGMzZmNueWd3eTk4aWJlNmI0dHd6OXR5azh3aCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/xT5LMB2WiOdjpB7K4o/giphy.gif)

