
local dashboards = (import "github.com/kubernetes-monitoring/kubernetes-mixin/mixin.libsonnet").grafanaDashboards;

{
  [name]: dashboards[name]
  for name in std.objectFields(dashboards)

}


