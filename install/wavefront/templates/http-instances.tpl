{{/* Generate instances for http metrics */}}
{{- define "instances.http" }}
# requestsize instance for template metric
apiVersion: "config.istio.io/v1alpha2"
kind: instance
metadata:
  name: requestsize
  {{- if .Values.namespace }}
  namespace: {{ .Values.namespace }}
  {{- else }}
  namespace: istio-system
  {{- end }}
spec:
  template: metric
  params:
    value: request.total_size | 0
    dimensions:
      {{- template "attributes.service" }}
      response_code: response.code | 200
    monitored_resource_type: '"UNSPECIFIED"'
---
# requestcount instance for template metric
apiVersion: "config.istio.io/v1alpha2"
kind: instance
metadata:
  name: requestcount
  {{- if .Values.namespace }}
  namespace: {{ .Values.namespace }}
  {{- else }}
  namespace: istio-system
  {{- end }}
spec:
  template: metric
  params:
    value: 1
    dimensions:
      {{- template "attributes.service" }}
      response_code: response.code | 200
    monitored_resource_type: '"UNSPECIFIED"'
---
# requestduration instance for template metric
apiVersion: "config.istio.io/v1alpha2"
kind: instance
metadata:
  name: requestduration
  {{- if .Values.namespace }}
  namespace: {{ .Values.namespace }}
  {{- else }}
  namespace: istio-system
  {{- end }}
spec:
  template: metric
  params:
    value: response.duration | "0ms"
    dimensions:
      {{- template "attributes.service" }}
      response_code: response.code | 200
    monitored_resource_type: '"UNSPECIFIED"'
---
# responsesize instance for template metric
apiVersion: "config.istio.io/v1alpha2"
kind: instance
metadata:
  name: responsesize
  {{- if .Values.namespace }}
  namespace: {{ .Values.namespace }}
  {{- else }}
  namespace: istio-system
  {{- end }}
spec:
  template: metric
  params:
    value: response.total_size | 0
    dimensions:
      {{- template "attributes.service" }}
      response_code: response.code | 200
    monitored_resource_type: '"UNSPECIFIED"'
{{- end }}
