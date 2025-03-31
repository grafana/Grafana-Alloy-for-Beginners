# Building OpenTelemetry and Prometheus native telemetry pipelines with Grafana Alloy

## Resources for the workshop

- [Environment set up](https://github.com/grafana/intro-to-mltp)
- [Grafana Alloy documentation](https://grafana.com/docs/alloy/latest/)

## Hands on sections

### Common tasks

#### Reloading the config

To reload Alloy's config, hit the following endpoint in a browser or with a tool like `curl`:

```bash
curl -X POST http://localhost:12347/-/reload
```

If the config is valid, you should see a response like the following:

```
config reloaded
```


### Section 1: Alloy logs and relabeling

#### Objectives

- Collect logs from Alloy using the `logging` block
- Use `loki.relabel` to add labels to the logs
- Write the logs to Loki

#### Instructions

Open `config.alloy` in your editor and copy the following code into it:

```alloy
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

Make sure to [reload the config](#reloading-the-config) after filling in the blocks!

#### Verification

To check that logs are being ingested, navigate to the [Grafana Explore Page](http://localhost:3000/explore), select the "Loki" data source, and run the following query:

```logql
{service="alloy"}
```

### Section 2: Collecting Loki metrics

#### Objectives

- Collect metrics from Loki using the `prometheus.scrape` component
- Use `prometheus.remote_write` to write the metrics to locally running Mimir

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

Don't forget to [reload the config](#reloading-the-config) after finishing.

#### Verification

To check that Loki's metrics are being ingested, navigate to the [Grafana Explore Page](http://localhost:3000/explore), select the "Mimir" data source, and run the following query:

```promql
rate(loki_distributor_bytes_received_total{job="prometheus.scrape.loki"}[$__rate_interval])
```

You should see values coming in for the logs we started ingesting in the previous section!

### Section 3: Alloy metrics and relabeling

#### Objectives

- Collect Alloy's own metrics using the `prometheus.exporter.self` component
- Use `prometheus.relabel` to add labels to the metrics
- Write the metrics to Mimir

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

Don't forget to [reload the config](#reloading-the-config) after finishing.

#### Verification

To check that Alloy's metrics are being ingested, navigate to the [Grafana Explore Page](http://localhost:3000/explore), select the "Mimir" data source, and run the following query:

```promql
rate(alloy_resources_process_cpu_seconds_total{job="prometheus.scrape.alloy"}[$__rate_interval])
```

You should see Alloy's CPU usage metrics coming in.

### Section 4: Postgres metrics

#### Objectives

- Collect metrics from Postgres using the `prometheus.scrape` component
- Use `prometheus.relabel` to add the `group="infrastructure"` and `service="postgres"` labels
- Write the metrics to Mimir

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

Don't forget to [reload the config](#reloading-the-config) after finishing.

#### Verification

To check that the Postgres metrics are being ingested, navigate to the [Dashboards](http://localhost:3000/dashboards) page and select the `PostgreSQL` dashboard. If you don't see the dashboard,
you can import it by clicking the `New` button on the top right, select `Import`, enter the dashboard ID `9628`, select the Mimir data source, and click `Import`.

You should see the panels in the Postgres dashboard populated with data.


### Section 5: Ingesting OTel traces

#### Objectives

- Receive spans from the Mythical services and Beyla
- Batch spans for efficient processing
- Write the spans to a local instance of Tempo

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

#### Verification

To check that traces are being ingested, navigate to the [Grafana Explore Page](http://localhost:3000/explore), select the "Tempo" data source, and run the following query:

```traceql
{span.beast="owlbear"}
```

You should see traces coming in for the Mythical services.

You can also navigate to the [Dashboards list](http://localhost:3000/dashboards) and select the `MLT Dashboard` dashboard. These dashboards are configured to use the metrics
from Spanmetrics, so you should see data for the spans we're ingesting.

### Section 6: Spanlogs

#### Objectives

- Take the traces we're already ingesting and convert them to logs
- Convert them to Loki format
- Use `loki.process` to:
  - Convert the body from JSON to logfmt using the `stage.json` and `stage.logfmt` stages
  - Add the `method`, `status`, and `target` labels from the `http.method`, `http.status_code`, and `http.target` attributes
- Write the logs to Loki

#### Instructions

Open `config.alloy` in your editor and copy the following code into it:

```alloy
otelcol.connector.spanlogs "autologging" {
    // TODO: Fill this in
}

otelcol.exporter.loki "autologging" {
    // TODO: Fill this in
}

// The Loki processor allows us to accept a correctly formatted Loki log and mutate it into
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

For the `otelcol.connector.spanlogs` component to work, we will need to forward the spans from the `otelcol.receiver.otlp`'s output > traces to the `otelcol.connector.spanlogs`'s input.

We'd like to make sure to only generate a log for each full trace, not for each span (that would be a lot of logs!).

We should also make sure to include the `http.method`, `http.target`, and `http.status_code` attributes in the logs.

### Exercise: Ingesting application logs

### Exercise: Filtering logs

### Advanced Exercise: Spanmetrics in Alloy
