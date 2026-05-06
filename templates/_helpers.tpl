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
Generate the standardized ingress path: /username/jobname
*/}}
{{- define "volcano-jupyter-spawner.ingressPath" -}}
{{- printf "/%s/%s" .Values.username .Values.jobName -}}
{{- end -}}
