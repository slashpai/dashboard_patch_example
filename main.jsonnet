local dashboards = (import 'github.com/kubernetes-monitoring/kubernetes-mixin/mixin.libsonnet').grafanaDashboards;

// example where it need to replace query
// dashboards['k8s-resources-cluster.json'].rows[10].panels[0].targets[0].expr
// need to identify mapping using std.map

// dashboards neededing patch
// keeping it for reference
local patchDashboards = [
  'k8s-resources-cluster.json',
  'k8s-resources-namespace.json',
  'k8s-resources-pod.json',
];

// Need to do for each dashboard separately since title is different in each

{
  [name]: dashboards[name] {
    rows: [
      row {
        panels: [
          panel {
            targets: [{
              expr: 'SOME_NEW_EXPRESSION',
              format: 'time_series',
              intervalFactor: 2,
              legendFormat: '{{namespace}}',
              legendLink: null,
              step: 10,
            }],
          }
          for panel in super.panels
          // if panel.title == 'IOPS(Reads+Writes)'
        ],
      }
      for row in super.rows
      // if row.title == 'Storage IO'
    ],
  }
  for name in std.objectFields(dashboards)
  if std.setMember(name, patchDashboards)
}
