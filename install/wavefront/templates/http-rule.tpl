{{/* Generate rule for http metrics */}}
{{- define "rule.http" }}
# rule to dispatch to handler wavefront-handler
apiVersion: "config.istio.io/v1alpha2"
kind: rule
metadata:
  name: wavefront-http-rule
  {{- if .Values.namespace }}
  namespace: {{ .Values.namespace }}
  {{- else }}
  namespace: istio-system
  {{- end }}
spec:
  actions:
  - handler: wavefront-handler.istio-system
    instances:
    - requestsize
    - requestcount
    - requestduration
    - responsesize
{{- end }}
