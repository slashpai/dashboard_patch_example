local dashboards = (import 'github.com/kubernetes-monitoring/kubernetes-mixin/mixin.libsonnet').grafanaDashboards;

local patchDashboards = [
  'k8s-resources-cluster.json',
  'k8s-resources-namespace.json',
  'k8s-resources-pod.json',
];

// print dashboards for comparing later
{
  [name]: dashboards[name]
  for name in std.objectFields(dashboards)
  if std.setMember(name, patchDashboards)
}
