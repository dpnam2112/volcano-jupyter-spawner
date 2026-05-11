{{/*
Generate core labels using a dictionary and toYaml for clean rendering.
*/}}
{{- define "volcano-jupyter-spawner.commonLabels" -}}
{{- $prefix := .Values.orgPrefix -}}
{{- /* Create the dictionary and set keys */ -}}
{{- $labels := dict -}}
{{- $_ := set $labels (printf "%s/username" $prefix) .Values.username -}}
{{- $_ := set $labels (printf "%s/job-name" $prefix) .Values.jobName -}}
{{- $_ := set $labels (printf "%s/service" $prefix) "volcano-jupyter-spawner" -}}
{{- $_ := set $labels "app.kubernetes.io/managed-by" "Helm" -}}
{{- /* Render the dictionary as YAML */ -}}
{{- $labels | toYaml -}}
{{- end -}}

{{/* 
Truncate at 63 chars and remove trailing hyphens 
*/}}
{{- define "volcano-jupyter-spawner.jobname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
